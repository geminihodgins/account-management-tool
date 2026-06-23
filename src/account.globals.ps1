$global:PASSWORD = [securestring]::new() # $global:PASSWORD = $plainText | ConvertTo-SecureString -AsPlainText -Force
$global:PATH     = ""
$global:ACL      = [PSCustomObject]@{}
$global:PATTERN  = '^[^,]+,\s*[^,]+(;\s*[^,]+)*,\s*[^,]*,\s*(ADD|REMOVE)$'

#region Output Font Color Variables
$Global:NormalDarkColor     = [System.Drawing.Color]::Black
$Global:NormalColor         = [System.Drawing.Color]::WhiteSmoke
$Global:IOColor             = [System.Drawing.Color]::LightBlue
$Global:ProcessColor        = [System.Drawing.Color]::Lavender
$Global:InfoColor           = [System.Drawing.Color]::Aquamarine
$Global:ValidationColor     = [System.Drawing.Color]::PaleGreen
$Global:WarningColor        = [System.Drawing.Color]::Yellow
$Global:StateColor          = [System.Drawing.Color]::Orange
$Global:ErrorColor          = [System.Drawing.Color]::LightCoral
#endregion

#region Enums
enum Action {
    # Initialization $Global:StateColor
    INITIATE
    BOOT
    SPAWN
    # Processing $Global:ProcessColor
    PROCESSING
    STARTING
    PAUSING
    RESUMING
    TERMINATING
    # Completion $Global:StateColor
    COMPLETE
    FINALIZE
    # Cancellation $Global:StateColor
    ABORT
    CANCEL
    TIMEOUT
    # Input/Output $Global:IOColor
    WRITE
    FETCH
    READ
    UPLOAD
    DOWNLOAD
    # Modification $Global:IOColor
    UPDATE
    MODIFY
    DELETE
    # Validation $Global:ValidationColor
    AUTHENTICATION
    AUTHORIZATION
    VALIDATION
    # Info $Global:InfoColor
    NOTICE
    BROADCAST
    STATUS_UPDATE
    # Warning $Global:WarningColor
    WARNING
    RETRYING
    RESTRICTED
    # Error $Global:ErrorColor
    FAILED
    EXCEPTION
    BLOCKED
    ERROR
}
#endregion

class LocalUserAccount {
    # 1. Identification & Profile Fields
    [System.Nullable[datetime]]$AccountExpires
    [string]$Description
    [bool]$Enabled
    [string]$FullName
    [System.Nullable[datetime]]$LastLogon
    [string]$Username
    [string]$ObjectClass
    [System.Nullable[datetime]]$PasswordChangeableDate
    [System.Nullable[datetime]]$PasswordExpires
    [System.Nullable[datetime]]$PasswordLastSet
    [bool]$PasswordRequired
    [System.Nullable[Microsoft.PowerShell.Commands.PrincipalSource]]$PrincipalSource
    [string]$SID
    [bool]$UserMayChangePassword

    LocalUserAccount($User) {
        $this.AccountExpires            = $User.AccountExpires
        $this.Description               = $User.Description
        $this.Enabled                   = $User.Enabled
        $this.FullName                  = $User.FullName
        $this.LastLogon                 = $User.LastLogon
        $this.Username                  = $User.Name
        $this.ObjectClass               = $User.ObjectClass
        $this.PasswordChangeableDate    = $User.PasswordChangeableDate
        $this.PasswordExpires           = $User.PasswordExpires
        $this.PasswordLastSet           = $User.PasswordLastSet
        $this.PasswordRequired          = $User.PasswordRequired
        $this.PrincipalSource           = $User.PrincipalSource
        $this.SID                       = $User.SID
        $this.UserMayChangePassword     = $User.UserMayChangePassword
    }

    LocalUserAccount() {}
}