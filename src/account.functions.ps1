#region User Functions
function Get-UserAccounts {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,

        [parameter(Mandatory)]
        [System.Windows.Forms.ListBox]$ListBox
    )
    $CustomUserList = Get-LocalUser | ForEach-Object { [LocalUserAccount]::new($_) }

    $BindingList = New-Object System.Collections.ArrayList
    $BindingList.AddRange($CustomUserList)

    $ListBox.DataSource = $BindingList
    $ListBox.DisplayMember = "Username"
}

function Set-DefaultUserPassword {
    # prompt with field to add password, make sure it is set as [securestring]
}

function Add-User() {
    param(
        [parameter(Mandatory)]
        [string]$username,

        [parameter(Mandatory)]
        [securestring]$password,

        [parameter(Mandatory)]
        [string]$description
    )

    if ($username.Length -gt 20) {
            Write-Output -Message "The Username '$($username)' is too long, skipping entry..." -Action ([Action]::WARNING)
            return $false
    }

    try {
        New-LocalUser -Name $username -Password $password -Description $description -ErrorAction Stop | Out-Null

        $User = [ADSI]"WinNT://localhost/$username,user"
        $User.PasswordExpired = 1
        $User.SetInfo()

        Write-Output -Message "Created '$($username)' successfully." -Action ([Action]::COMPLETE)
        return $true
    } catch [Microsoft.PowerShell.Commands.InvalidPasswordException] {
        Write-Output -Message "Password does not meet minimum requirements" -Action ([Action]::ERROR)
        return $false
    } catch [Microsoft.PowerShell.Commands.InvalidNameException] {
        Write-Output -Message "Username '$($username)' is invalid" -Action ([Action]::ERROR)
        return $false
    } catch {
        Write-Output -Message "Unable to create user accounts" -Action ([Action]::ERROR)
        return $false
    }
}

function Test-UserExists([string]$user) {
    try {
        Write-Output -Message "Searching for '$($user)' in user database" -Action ([Action]::FETCH)
        Get-LocalUser $user -ErrorAction Stop | Out-Null
        Write-Output -Message "User '$($user)' found" -Action ([Action]::COMPLETE)
        return $true
    } catch [Microsoft.PowerShell.Commands.UserNotFoundException] {
        Write-Output -Message "User '$($user)' not found" -Action ([Action]::WARNING)
        return $false
    } catch {
        Write-Output -Message "Not able to read user database" -Action ([Action]::ERROR)
        return $false
    }
}

function Remove-User([string]$user) {
    try {
        Remove-LocalUser -Name $user -ErrorAction Stop | Out-Null
        Write-Output -Message "'$($user)' removed successfully" -Action ([Action]::COMPLETE)
        return $true
    } catch {
        Write-Output -Message "Failed to remove '$($user)', manual action required" -Action ([Action]::WARNING)
        return $false
    }
}

function Test-DefaultPassword([securestring]$password) {
    if ([string]::IsNullOrWhiteSpace($password)) {
        Write-Output -Message "A default password must be set before importing user accounts." -Action ([Action]::ERROR)
        return $false
    }

    return $true
}
#endregion

#region Group Functions
function Add-UserToGroup([string]$group, [string]$user) {
    try {
        Write-Output -Message "Adding '$($user)' to '$($group)'..." -Action ([Action]::PROCESSING)
        Add-LocalGroupMember -Group $group -Member $user
        Write-Output -Message "User: '$($user)' successfully added to group: '$($group)'." -Action ([Action]::COMPLETE)
        return $true
    } catch {
        Write-Output -Message "Can not add users to security groups" -Action ([Action]::ERROR)
        return $false
    }
}

function Remove-UserFromGroup([string]$group, [string] $user) {
    if (IsEmptyOrWhitespace($group) -or IsEmptyOrWhitespace($user)) { return $false }

    try {
        Write-Output -Message "Removing user: '$($user)' from group: '$($group)'..." -Action ([Action]::DELETE)
        Remove-LocalGroupMember -Group $group -Member $user
        Write-Output -Message "User: '$($user)' successfully removed from group: '$($group)'." -Action ([Action]::COMPLETE)
        return $true
    } catch {
        Write-Output -Message "Failed to remove user: '$($user)' from group: '$($group)'" -Action ([Action]::ERROR)
        return $false
    }

    return $true
}

function Update-UserGroups {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,

        [parameter(Mandatory)]
        [string]$username,
        [parameter(Mandatory)]
        [System.Object[]]$groups,
        [parameter(Mandatory)]
        [string]$action
    )

    if (IsEmptyOrWhitespace($username) -or ($groups.Length -eq 0) -or IsEmptyOrWhitespace($action)) { return $false }

    if (-not ($action -match "ADD|REMOVE")) { return $false }

    foreach ($grp in $groups) {
        if (IsEmptyOrWhitespace($group)) { continue }

        $group = $grp.Trim()

        if (-not (Test-GroupExists($group.Trim()))) {
            Write-Output -Massage "Group '$($group)' does not exist in local security group." -Action ([Action]::NOTICE)
            Write-Output -Massage "Creating '$($group)'..." -Action ([Action]::NOTICE)
            Add-Group($group)
        }
        
        if ($action -eq "ADD") {
            if (-not (Test-UserInGroup($group, $username))) {
                if (-not (Add-UserToGroup($group, $username))) { continue }
            }
        } elseif ($action -eq "REMOVE") {
            if (Test-UserInGroup($group, $username)) {
                if (-not (Remove-UserFromGroup($group, $username))) { continue }
            }
        } else {
            Write-Output -Massage "Action not recognized. Skipping entry..." -Action ([Action]::ERROR)
            continue
        }

        Start-Sleep -Milliseconds 500
    }

    return $true
}

function Test-GroupExists([string]$group) {
    try{
        Get-LocalGroup -Name $group.Trim() -ErrorAction Stop | Out-Null
        Write-Output -Message "Group '$($group)' found" -Action ([Action]::COMPLETE)
        return $true
    } catch [Microsoft.PowerShell.Commands.GroupNotFoundException] {
        Write-Output -Message "Group '$($group)' was not found" -Action ([Action]::WARNING)
        return $false
    } catch {
        Write-Output -Message "You are unable to read security groups" -Action ([Action]::ERROR)
        return $false
    }
}

function Add-Group([string]$group) {
    try {
        New-LocalGroup -Name $group -ErrorAction Stop | Out-Null
        Write-Output -Message "Group '$($group)' created successfully." -Action ([Action]::COMPLETE)
        return $true
    } catch {
        Write-Output -Message "Failed to create group '$($group)'" -Action ([Action]::ERROR)
        return $false
    }
}

function Test-UserInGroup([string]$group, [string]$user) {
    try {
        Get-LocalGroupMember -Group $($group.Trim()) -Member $($user.Trim()) -ErrorAction Stop | Out-Null
        Write-Output -Message "User: '$($user)', is aleady in group: '$($group)', skipping action..." -Action ([Action]::COMPLETE)
        return $true
    } catch [Microsoft.PowerShell.Commands.PrincipalNotFoundException] {
        Write-Output -Message "'$($user)' not in group '$($group)'" -Action ([Action]::WARNING)
        return $false
    } catch {
        Write-Output -Message "Not able to access security group member list" -Action ([Action]::ERROR)
        return $false
    }
}
#endregion

#region Tool Specific Functions
function Confirm-Privileges {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )

    if ($script:IsAdmin) {
        $Form.Text = "Account Management Tool (Administrator)"
        Write-Output -Message "Administrator privileges confirmed" -Action ([Action]::AUTHENTICATION)
    } else {
        $Form.Text = "Account Management Tool (Restricted)"
        Write-Output -Message "Administrator privileges invalid" -Action ([Action]::WARNING)

        Disable-AccountManagementTool
    }
}

function Disable-AccountManagementTool {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )

    if (-not $script:IsAdmin) {
        # Loop through control list and disable them.
    }
}

function Write-Status {
    <#
    .SYNOPSIS
        Writes message to status bar.
    #>
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,

        [parameter(Mandatory)]
        [string]$Message,

        [parameter(Mandatory)]
        [Action]$Action
    )

    [System.Drawing.Color]$Color = Get-ActionColor -Action $Action

    if ($Message) {
        [string]$CombinedMessage = "$($Action): " + $Message
        $Form.lblStatus.ForeColor = $Color
        $Form.lblStatus.Text = $CombinedMessage
    } else {
        $Form.lblStatus.Text = ""
    }
}

function Write-Output {
    <#
    .SYNOPSIS
        Logs tool activity to the output box.
    .DESCRIPTION
        Logs color dynamic time-stamped messages to the output box.
    #>
    param (
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,
        [System.Windows.Forms.RichTextBox]$Box = $AccountManagementTool.txtOutput,
        [System.Drawing.Color]$Color = $NormalColor,
        [bool]$Timestamp = $true,
        [Action]$Action = [Action]::NOTICE,
        [bool]$ActionRequired = $true,

        [Parameter(Mandatory)]
        [string[]]$Message
    )

    if ($Timestamp) {
        Write-Timestamp -Box $Box
    }

    if ($ActionRequired) {
        Write-Action -Action $Action -Box $Box
    }

    # Move the cursor to the end
    $Box.SelectionStart = $Box.TextLength
    $Box.SelectionLength = 0
    $Box.SelectionCharOffset = 0

    # Set the color and append
    $Box.SelectionColor = $Color

    $FullMessage = $Message -join " "
    
    $Box.AppendText("$FullMessage`r`n")

    # Reset color to default (Black) for next message
    $Box.SelectionColor = $NormalColor

    # Auto-scroll to bottom
    $Box.ScrollToCaret()
}

function Write-Timestamp {
    param(
        [System.Windows.Forms.RichTextBox]$Box
    )

    $start = $Box.TextLength
    $timestamp = "[$(Get-Date -Format 'HH:mm:ss')]-> "

    $Box.Select($start, $timestamp.TextLength)
    $Box.SelectionColor = $NormalColor
    $Box.SelectionLength = 0
    $Box.AppendText("$timestamp")
    $Box.ScrollToCaret()
}

function Write-Action {
    param (
        [parameter(Mandatory)]
        [Action]$Action,

        [parameter(Mandatory)]
        [System.Windows.Forms.RichTextBox]$Box,

        [System.Drawing.Color]$UndoActionColor = $NormalColor
    )

    [System.Drawing.Color]$Color = Get-ActionColor -Action $Action

    $start = $Box.TextLength
    
    $Box.Select($start, $Action.TextLength)
    $Box.SelectionColor = $Color
    $Box.SelectionLength = 0
    $Box.AppendText("$Action" + ": ")
    $Box.SelectionColor = $UndoActionColor
    $Box.ScrollToCaret()
}

function Get-ActionColor {
    param(
        [parameter(Mandatory)]
        [Action]$Action
    )

    [System.Drawing.Color]$Color = $NormalColor
    switch ($Action) {
        ([Action]::INITIATE) { $Color = $StateColor }
        ([Action]::BOOT) { $Color = $StateColor }
        ([Action]::SPAWN) { $Color = $StateColor }
        ([Action]::PROCESSING) { $Color = $ProcessColor }
        ([Action]::STARTING) { $Color = $ProcessColor }
        ([Action]::PAUSING) { $Color = $ProcessColor }
        ([Action]::RESUMING) { $Color = $ProcessColor }
        ([Action]::TERMINATE) { $Color = $ProcessColor }
        ([Action]::COMPLETE) { $Color = $StateColor }
        ([Action]::FINALIZE) { $Color = $StateColor }
        ([Action]::ABORT) { $Color = $StateColor }
        ([Action]::CANCEL) { $Color = $StateColor }
        ([Action]::TIMEOUT) { $Color = $StateColor }
        ([Action]::WRITE) { $Color = $IOColor }
        ([Action]::FETCH) { $Color = $IOColor }
        ([Action]::READ) { $Color = $IOColor }
        ([Action]::UPLOAD) { $Color = $IOColor }
        ([Action]::DOWNLOAD) { $Color = $IOColor }
        ([Action]::UPDATE) { $Color = $IOColor }
        ([Action]::MODIFY) { $Color = $IOColor }
        ([Action]::DELETE) { $Color = $IOColor }
        ([Action]::AUTHENTICATION) { $Color = $ValidationColor }
        ([Action]::AUTHORIZATION) { $Color = $ValidationColor }
        ([Action]::VALIDATION) { $Color = $ValidationColor }
        ([Action]::NOTICE) { $Color = $InfoColor }
        ([Action]::BROADCAST) { $Color = $InfoColor }
        ([Action]::STATUS_UPDATE) { $Color = $InfoColor }
        ([Action]::WARNING) { $Color = $WarningColor }
        ([Action]::RETRYING) { $Color = $WarningColor }
        ([Action]::RESTRICTED) { $Color = $WarningColor }
        ([Action]::FAILED) { $Color = $ErrorColor }
        ([Action]::EXCEPTION) { $Color = $ErrorColor }
        ([Action]::BLOCKED) { $Color = $ErrorColor }
        ([Action]::ERROR) { $Color = $ErrorColor }
    }

    return $Color
}

function Test-ACLPath {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,
        [parameter(Mandatory)]
        [string]$FilePath
    )
    
    $path = $FilePath.Trim()

    #$testPath = "C:\Users\philip.hodgins\Projects\AuditAccessProject\TestEventData\ACL_File.txt"

    if ([string]::IsNullOrWhiteSpace($path)) { return $false }

    if (-not (Test-Path -Path "$path" -IsValid) -or $path -match '\s') {
        Write-Output -Message "Path is not a valid format, please remove whitespaces and special characters." -Action ([Action]::ABORT)
        $script:IsValid = $false
        return $false
    }

    if (-not (Test-Path -Path "$path" -PathType Leaf)) {
        Write-Output -Message "File does not exist at:", $path -Action ([Action]::ABORT)
        $script:IsValid = $false
        return $false
    }

    $aclContent = Get-Content -Path $path

    if ($aclContent.Length -le 0) {
        Write-Output -Message "File is empty!" -Action ([Action]::ABORT)
        $script:IsValid = $false
        return $false
    }

    $script:IsValid = $true
    return $true
}

function Test-ACLSchema {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,
        [parameter(Mandatory)]
        [string]$Line,
        [parameter(Mandatory)]
        [string]$Pattern
    )

    if (-not ($Line -match $Pattern)) {
        Write-Output -Message "ACL Schema failed to validate:" -Action ([Action]::WARNING)
        Write-Output -Message "-> $Line" -ActionRequired $false -Timestamp $false
        return $false
    }

    
    return $true
}

function Initialize-ACLFileValidation {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,
        [parameter(Mandatory)]
        [System.Object[]]$TextArray
    )

    if ($TextArray.Length -le 0) { return $false }

    $failCount = 0

    foreach ($line in $TextArray) {
        if (IsEmptyOrWhitespace($line)) { continue }
        if (-not (Test-ACLSchema -Line $line.Trim() -Pattern $global:PATTERN)) { $failCount++ }
    }

    if ($failCount -gt 0) { 
        Write-Output -Message "Invalid lines in ACL file:", $failCount -Action ([Action]::WARNING)
        $Form.rtbACLReview.BackColor = [System.Drawing.Color]::MistyRose
        $script:IsValid = $false
        Test-ForValidImportExport
        return $false
    } else {
        Write-Output -Message "ACL file validation successful." -Action ([Action]::COMPLETE)
        $Form.rtbACLReview.BackColor = [System.Drawing.Color]::White
        $script:IsValid = $true
        Test-ForValidImportExport
        return $true
    }
    
}

function Test-ForValidImportExport {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )

    $importValidateBackColor = [System.Drawing.Color]::LemonChiffon
    $exportBackColor = [System.Drawing.Color]::LemonChiffon

    if (-not $script:IsValid -or (IsEmptyOrWhitespace($Form.txtDefaultPassword.Text))) {
        $importValidateBackColor = [System.Drawing.Color]::LemonChiffon
        $script:EnableImport = $false
        
    } else {
        $importValidateBackColor = [System.Drawing.Color]::LightGreen
        $script:EnableImport = $true
    }

    if ($script:IsValid) { 
        $exportBackColor = [System.Drawing.Color]::LightGreen
        $script:EnableExport = $true
    } else {
        $exportBackColor = [System.Drawing.Color]::LemonChiffon
        $script:EnableExport = $false
    }

    $Form.btnImportACL.Enabled = $script:EnableImport
    $Form.btnExportACL.Enabled = $script:EnableExport
    $Form.btnValidateFile.BackColor = $importValidateBackColor
    $Form.btnImportACL.BackColor = $importValidateBackColor
    $Form.btnExportACL.BackColor = $exportBackColor
}

function IsEmptyOrWhitespace([string]$Text) {

    if ([string]::IsNullOrWhiteSpace($Text)) {return $true}

    return $false
}

function Set-ButtonImage {
    param(
        [parameter(Mandatory)]
        [int]$IconIndex,

        [int]$Size = 32,

        [string]$LibraryPath = "C:\Windows\System32\shell32.dll",

        [parameter(Mandatory)]
        [System.Windows.Forms.ToolStripButton]$ToolStripButton
    )
    
    $phicon = New-Object IntPtr[] 1
    $piconid = New-Object UInt32[] 1

    $result = [Win32Icons]::PrivateExtractIcons($LibraryPath, $IconIndex, $Size, $Size, $phicon, $piconid, 1, 0)

    if ($result -gt 0 -and $phicon[0] -ne [System.IntPtr]::Zero) {
        $nativeIcon = [System.Drawing.Icon]::FromHandle($phicon[0])

        $managedIcon = [System.Drawing.Bitmap]::FromHicon($nativeIcon.Handle)

        $nativeIcon.Dispose()
        [Win32Icons]::DestroyIcon($phicon[0])

        $ToolStripButton.Image = $managedIcon        
    }

    return $null
}

function Get-CurrentUser {
    <#
    .SYNOPSIS
        Gets the currently logged in user
    #>
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )

    $username = ($script:User -split '\\')[-1]
    $script:User = $username

    $Form.txtCurrentUser.Text = $username
    Write-Output -Message "User:", "$username`r`n" -Timestamp $false -ActionRequired $false
}

function Start-Application {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )

    $AboutMessage = @"
Account Management Tool
Version: 1.0.0
Author: Philip Hodgins

Purpose:
This tool provides easy to access local account management
to include bulk account creation.

System Requirements:
- Run as Administrator
- PowerShell 5.1+`r`n
"@

    Write-Output -Message "$AboutMessage" -Timestamp $false -ActionRequired $false
    Write-Output -Message "$(Get-Date -Format 'dddd, MMMM dd, yyyy hh:mm:ss tt')" -Timestamp $false -ActionRequired $false

    Get-CurrentUser
    #Confirm-Privileges

}

function Set-ACL {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,
        [bool]$IsImport = $true,
        [parameter(Mandatory)]
        [System.Object[]]$TextArray   
    )

    if (-not (Initialize-ACLFileValidation -TextArray $TextArray)) { return }

    Write-Output -Message "Clearing ACL object for construction..." -Action ([Action]::MODIFY)
    $global:ACL = [PSCustomObject]@{}

    Write-Output -Message "Constructing ACL object with current file data..." -Action ([Action]::MODIFY)

    $global:ACL = foreach ($line in $TextArray) {
        if (IsEmptyOrWhitespace($line)) { continue }

        $INPUTARRAY = $line.Split(",")

        if (-not (IsEmptyOrWhitespace($INPUTARRAY[0]))) {
            $USERNAME = $INPUTARRAY[0].Trim()
        }
        if (-not (IsEmptyOrWhitespace($INPUTARRAY[1]))) {
            $GROUPARRAY = $INPUTARRAY[1].Trim().split(";")
        }
        if (-not (IsEmptyOrWhitespace($INPUTARRAY[2]))) {
            $DESCRIPTION = $INPUTARRAY[2].Trim()
        }
        if (-not (IsEmptyOrWhitespace($INPUTARRAY[3]))) {
            $ACTION = $INPUTARRAY[3].Trim()
        }

        $GROUPS = foreach ($GROUPNAME in $GROUPARRAY) {
            if (-not (IsEmptyOrWhitespace($GROUPNAME))) {
                [PSCustomObject]@{
                Group = $GROUPNAME.Trim()
            }
            }
        }

        if ($IsImport) {
            $Form.rtbACLReview.AppendText("$line`r`n")
            Write-Output -Message "Importing '$($line)'" -Action ([Action]::NOTICE)
        }
        
        [PSCustomObject]@{
            Username    = $USERNAME
            Groups      = $GROUPS
            Description = $DESCRIPTION
            Action      = $ACTION
        }
    }
    Write-Output -Message "ACL object successfully constructed." -Action ([Action]::COMPLETE)

    if ($IsImport) {
        Write-Output -Message "ACL Imported successfully." -Action ([Action]::COMPLETE)
    }
}

function Import-ACLFile {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool,
        [parameter(Mandatory)]
        [string]$FilePath
    )

    $path = $FilePath.Trim()

    if (-not (Test-ACLPath -FilePath $path)) { return }

    if ($Form.rtbACLReview.Length -gt 0) {
        $Form.rtbACLReview.Clear()
    }
    

    $aclContent = (Get-Content -Path $path).Trim()

    Set-ACL -TextArray $aclContent
}

function Start-ACLProcessing {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )
    if (IsEmptyOrWhitespace($Form.rtbACLReview.Text)) { return }

    Write-Output -Message "Processing Account Control List..." -Action ([Action]::STARTING)

    $textArray = $Form.rtbACLReview.Lines

    Set-ACL -TextArray $textArray -IsImport $false
    $successCount = 0

    foreach ($line in $global:ACL) {
        if (IsEmptyOrWhitespace($line.Username)) { continue }
        if ($line.Action -eq "ADD") {
            if (Test-UserExists($line.Username)) {
                Write-Output -Message "User: '$($line.Username)' found." -Action ([Action]::FETCH)
            } else {
                Write-Output -Message "User not found." -Action ([Action]::FETCH)
                Write-Output -Message "Creating user: '$($line.Username)'..." -Action ([Action]::WRITE)
                if (-not (Add-User $line.Username $global:PASSWORD $line.Description)) { continue }
            }
        } elseif ($line.Action -eq "REMOVE") {
            if (Test-UserExists($line.Username)) {
                Write-Output -Message "User: '$($line.Username)' found." -Action ([Action]::FETCH)
                Write-Output -Message "Removing user: '$($line.Username)'..." -Action ([Action]::PROCESSING)
                if (-not (Remove-User($line.Username))) { continue }
            }
        } else {
            Write-Output -Message "The action: '$($line.Action)' provided is invalid." -Action ([Action]::PROCESSING)
            return
        }

        if (-not (Test-UserExists($line.Username))) {
            Write-Output -Message "User: '$($line.Username)' not found, skipping update to groups..." -Action ([Action]::PROCESSING)
            continue
        }

        Write-Output -Message "Updating groups for user: '$($line.Username)'..." -Action ([Action]::PROCESSING)
        if (-not (Update-UserGroups -username $line.Username -groups $line.Groups -action $line.Action)) { continue }

        $successCount++
    }

    $failureCount = $global:ACL.Count - $successCount

    Write-Output -Message "Account Control List processed successfully:" -Action ([Action]::COMPLETE)
    Write-Output -Message "-> Successes: $($successCount.ToString())" -Timestamp $false -ActionRequired $false
    Write-Output -Message "-> Failures:  $($failureCount.ToString())" -Timestamp $false -ActionRequired $false
    
}
#endregion

#region Invoke Functions
function Invoke-About {
    $AboutMessage = @"
Account Management Tool
Version: 1.0.0
Author: Philip Hodgins

Purpose:
This tool provides easy to access local account management
to include bulk account creation.

System Requirements:
- Run as Administrator
- PowerShell 5.1+
"@

    [System.Windows.Forms.MessageBox]::Show($AboutMessage, "About Account Management Tool", "OK", "Information")
}

function Invoke-ACLProperties {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )

    # Open ACL Properties Window to set properties for Access Control List aka Bulk User import
}

function Invoke-ProcessACL {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )
    Start-ACLProcessing
}

function Invoke-ExportACL {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )
    # Open file dialog to save ACL

    if (IsEmptyOrWhitespace($Form.rtbACLReview.Text)) { return }

    $linesArray = $Form.rtbACLReview.Lines
    
    if (-not (Initialize-ACLFileValidation -TextArray $linesArray)) {
        return
    }
    
    $SaveDialog = New-Object System.Windows.Forms.SaveFileDialog

    $SaveDialog.Title = "Save ACL As"
    $SaveDialog.Filter = "Text Files (*.txt)|*.txt|CSV Files(*.csv)|*.csv"
    $SaveDialog.DefaultExt = "txt"
    $SaveDialog.AddExtension = $true
    $SaveDialog.OverwritePrompt = $true

    $Result = $SaveDialog.ShowDialog()

    if ($Result -eq [System.Windows.Forms.DialogResult]::OK) {
        $FilePath = $SaveDialog.FileName
        Write-Output -Message "File selected: $FilePath" -Action ([Action]::NOTICE)

         try {
            $Form.rtbACLReview.Text | Out-File -FilePath $FilePath -Encoding utf8 -Force
            Write-Output -Message "File saved as: $FilePath" -Action ([Action]::WRITE)
        } catch {
            Write-Output -Message "There was a problem saving file: $_" -Action ([Action]::ERROR)
            return
        }

        $Form.txtACLPath.Text = $FilePath
        Import-ACLFile -FilePath $FilePath
    }
}

function Invoke-BrowseACL {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Title = "Select ACL File"
    $dialog.Filter = "Text Files (*.txt)|*.txt|CSV Files(*.csv)|*.csv"
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        [string]$path = "$($dialog.FileName)"
        $Form.txtACLPath.Text = $path
        Import-ACLFile -FilePath $path
    }
}

function Invoke-ValidateFile {
    param(
        [System.Windows.Forms.Form]$Form = $AccountManagementTool
    )

    if (IsEmptyOrWhitespace($Form.rtbACLReview.Text)) { return }

    $linesArray = $Form.rtbACLReview.Lines

    Set-ACL -IsImport $false -TextArray $linesArray
}
#endregion