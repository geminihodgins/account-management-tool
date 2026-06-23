$AccountManagementTool = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Panel]$pFrameworkPanel = $null
[System.Windows.Forms.Panel]$pContentFrameworkPanel = $null
[System.Windows.Forms.Panel]$pCenterContentPanel = $null
[System.Windows.Forms.ToolStrip]$tsACLReview = $null
[System.Windows.Forms.ToolStripLabel]$ToolStripLabel1 = $null
[System.Windows.Forms.ToolStripTextBox]$tsACLPatternBox = $null
[System.Windows.Forms.ToolStripButton]$btnValidateFile = $null
[System.Windows.Forms.Button]$Button1 = $null
[System.Windows.Forms.ToolTip]$ttAMToolTips = $null
[System.ComponentModel.IContainer]$components = $null
[System.Windows.Forms.Label]$lblDefaultPassword = $null
[System.Windows.Forms.TextBox]$txtDefaultPassword = $null
[System.Windows.Forms.Button]$btnExportACL = $null
[System.Windows.Forms.Button]$btnImportACL = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.Button]$btnACLBrowse = $null
[System.Windows.Forms.TextBox]$txtACLPath = $null
[System.Windows.Forms.Label]$lblACLLabel = $null
[System.Windows.Forms.Label]$lblConsoleSeparator = $null
[System.Windows.Forms.RichTextBox]$rtbACLReview = $null
[System.Windows.Forms.Panel]$pConsolePanel = $null
[System.Windows.Forms.RichTextBox]$txtOutput = $null
[System.Windows.Forms.Panel]$pFrameworkBottomPanel = $null
[System.Windows.Forms.StatusStrip]$ssStatus = $null
[System.Windows.Forms.ToolStripStatusLabel]$lblStatus = $null
[System.Windows.Forms.Label]$lblStatusSeparator = $null
[System.Windows.Forms.MenuStrip]$msMainMenu = $null
[System.Windows.Forms.ToolStripMenuItem]$miFile = $null
[System.Windows.Forms.ToolStripMenuItem]$miExit = $null
[System.Windows.Forms.ToolStripMenuItem]$miEdit = $null
[System.Windows.Forms.ToolStripMenuItem]$miACLProperties = $null
[System.Windows.Forms.ToolStripMenuItem]$miHelp = $null
[System.Windows.Forms.ToolStripMenuItem]$miAbout = $null
[System.Windows.Forms.ToolStripTextBox]$txtCurrentUser = $null
[System.Windows.Forms.Label]$lblMainMenuSeparator = $null
[System.Windows.Forms.ToolTip]$ttImportButton = $null
function InitializeComponent
{
$components = (New-Object -TypeName System.ComponentModel.Container)
$resources = . (Join-Path $PSScriptRoot 'account.resources.ps1')
$pFrameworkPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$pContentFrameworkPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$pCenterContentPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$tsACLReview = (New-Object -TypeName System.Windows.Forms.ToolStrip)
$ToolStripLabel1 = (New-Object -TypeName System.Windows.Forms.ToolStripLabel)
$tsACLPatternBox = (New-Object -TypeName System.Windows.Forms.ToolStripTextBox)
$btnValidateFile = (New-Object -TypeName System.Windows.Forms.ToolStripButton)
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$lblDefaultPassword = (New-Object -TypeName System.Windows.Forms.Label)
$txtDefaultPassword = (New-Object -TypeName System.Windows.Forms.TextBox)
$btnExportACL = (New-Object -TypeName System.Windows.Forms.Button)
$btnImportACL = (New-Object -TypeName System.Windows.Forms.Button)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$btnACLBrowse = (New-Object -TypeName System.Windows.Forms.Button)
$txtACLPath = (New-Object -TypeName System.Windows.Forms.TextBox)
$lblACLLabel = (New-Object -TypeName System.Windows.Forms.Label)
$lblConsoleSeparator = (New-Object -TypeName System.Windows.Forms.Label)
$rtbACLReview = (New-Object -TypeName System.Windows.Forms.RichTextBox)
$pConsolePanel = (New-Object -TypeName System.Windows.Forms.Panel)
$txtOutput = (New-Object -TypeName System.Windows.Forms.RichTextBox)
$pFrameworkBottomPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$ssStatus = (New-Object -TypeName System.Windows.Forms.StatusStrip)
$lblStatus = (New-Object -TypeName System.Windows.Forms.ToolStripStatusLabel)
$lblStatusSeparator = (New-Object -TypeName System.Windows.Forms.Label)
$msMainMenu = (New-Object -TypeName System.Windows.Forms.MenuStrip)
$miFile = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$miExit = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$miEdit = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$miACLProperties = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$miHelp = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$miAbout = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$txtCurrentUser = (New-Object -TypeName System.Windows.Forms.ToolStripTextBox)
$lblMainMenuSeparator = (New-Object -TypeName System.Windows.Forms.Label)
$ttAMToolTips = (New-Object -TypeName System.Windows.Forms.ToolTip -ArgumentList @($components))
$ttImportButton = (New-Object -TypeName System.Windows.Forms.ToolTip -ArgumentList @($components))
$pFrameworkPanel.SuspendLayout()
$pContentFrameworkPanel.SuspendLayout()
$pCenterContentPanel.SuspendLayout()
$tsACLReview.SuspendLayout()
$pConsolePanel.SuspendLayout()
$pFrameworkBottomPanel.SuspendLayout()
$ssStatus.SuspendLayout()
$msMainMenu.SuspendLayout()
$AccountManagementTool.SuspendLayout()
#
#pFrameworkPanel
#
$pFrameworkPanel.AutoSize = $true
$pFrameworkPanel.Controls.Add($pContentFrameworkPanel)
$pFrameworkPanel.Controls.Add($pFrameworkBottomPanel)
$pFrameworkPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$pFrameworkPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]27))
$pFrameworkPanel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$pFrameworkPanel.Name = [System.String]'pFrameworkPanel'
$pFrameworkPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]678))
$pFrameworkPanel.TabIndex = [System.Int32]0
#
#pContentFrameworkPanel
#
$pContentFrameworkPanel.AutoSize = $true
$pContentFrameworkPanel.BackColor = [System.Drawing.Color]::White
$pContentFrameworkPanel.Controls.Add($pCenterContentPanel)
$pContentFrameworkPanel.Controls.Add($pConsolePanel)
$pContentFrameworkPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$pContentFrameworkPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$pContentFrameworkPanel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$pContentFrameworkPanel.Name = [System.String]'pContentFrameworkPanel'
$pContentFrameworkPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]655))
$pContentFrameworkPanel.TabIndex = [System.Int32]6
#
#pCenterContentPanel
#
$pCenterContentPanel.BackColor = [System.Drawing.Color]::White
$pCenterContentPanel.Controls.Add($tsACLReview)
$pCenterContentPanel.Controls.Add($Button1)
$pCenterContentPanel.Controls.Add($lblDefaultPassword)
$pCenterContentPanel.Controls.Add($txtDefaultPassword)
$pCenterContentPanel.Controls.Add($btnExportACL)
$pCenterContentPanel.Controls.Add($btnImportACL)
$pCenterContentPanel.Controls.Add($Label1)
$pCenterContentPanel.Controls.Add($btnACLBrowse)
$pCenterContentPanel.Controls.Add($txtACLPath)
$pCenterContentPanel.Controls.Add($lblACLLabel)
$pCenterContentPanel.Controls.Add($lblConsoleSeparator)
$pCenterContentPanel.Controls.Add($rtbACLReview)
$pCenterContentPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$pCenterContentPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$pCenterContentPanel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$pCenterContentPanel.Name = [System.String]'pCenterContentPanel'
$pCenterContentPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]499))
$pCenterContentPanel.TabIndex = [System.Int32]2
#
#tsACLReview
#
$tsACLReview.AutoSize = $false
$tsACLReview.BackColor = [System.Drawing.Color]::LightSteelBlue
$tsACLReview.CanOverflow = $false
$tsACLReview.Dock = [System.Windows.Forms.DockStyle]::None
$tsACLReview.GripMargin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$tsACLReview.GripStyle = [System.Windows.Forms.ToolStripGripStyle]::Hidden
$tsACLReview.Items.AddRange([System.Windows.Forms.ToolStripItem[]]@($ToolStripLabel1,$tsACLPatternBox,$btnValidateFile))
$tsACLReview.LayoutStyle = [System.Windows.Forms.ToolStripLayoutStyle]::HorizontalStackWithOverflow
$tsACLReview.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]99))
$tsACLReview.Name = [System.String]'tsACLReview'
$tsACLReview.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10,[System.Int32]3,[System.Int32]10,[System.Int32]3))
$tsACLReview.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]696,[System.Int32]30))
$tsACLReview.TabIndex = [System.Int32]11
$tsACLReview.Text = [System.String]'tsACLReview'
#
#ToolStripLabel1
#
$ToolStripLabel1.Name = [System.String]'ToolStripLabel1'
$ToolStripLabel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]21))
$ToolStripLabel1.Text = [System.String]'Validation Pattern:'
#
#tsACLPatternBox
#
$tsACLPatternBox.BackColor = [System.Drawing.Color]::White
$tsACLPatternBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$tsACLPatternBox.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Consolas',[System.Single]8.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$tsACLPatternBox.ForeColor = [System.Drawing.Color]::DimGray
$tsACLPatternBox.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$tsACLPatternBox.Name = [System.String]'tsACLPatternBox'
$tsACLPatternBox.Overflow = [System.Windows.Forms.ToolStripItemOverflow]::Never
$tsACLPatternBox.ReadOnly = $true
$tsACLPatternBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]330,[System.Int32]24))
$tsACLPatternBox.Text = [System.String]'^[^,]+,\s*[^,]+(;\s*[^,]+)*,\s*[^,]*,\s*(ADD|REMOVE)$'
$tsACLPatternBox.TextBoxTextAlign = [System.Windows.Forms.HorizontalAlignment]::Center
#
#btnValidateFile
#
$btnValidateFile.Alignment = [System.Windows.Forms.ToolStripItemAlignment]::Right
$btnValidateFile.BackColor = [System.Drawing.Color]::LemonChiffon
$btnValidateFile.DisplayStyle = [System.Windows.Forms.ToolStripItemDisplayStyle]::Text
$btnValidateFile.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Consolas',[System.Single]9,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$btnValidateFile.Image = ([System.Drawing.Image]$resources.'btnValidateFile.Image')
$btnValidateFile.ImageTransparentColor = [System.Drawing.Color]::Magenta
$btnValidateFile.Name = [System.String]'btnValidateFile'
$btnValidateFile.Overflow = [System.Windows.Forms.ToolStripItemOverflow]::Never
$btnValidateFile.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]102,[System.Int32]21))
$btnValidateFile.Text = [System.String]'Validate File'
$btnValidateFile.ToolTipText = [System.String]'Default password must be set before Import.'
#
#Button1
#
$Button1.BackColor = [System.Drawing.Color]::LightBlue
$Button1.FlatAppearance.BorderColor = [System.Drawing.Color]::DimGray
$Button1.FlatAppearance.MouseDownBackColor = [System.Drawing.Color]::LightCyan
$Button1.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::LightSteelBlue
$Button1.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]657,[System.Int32]74))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]44,[System.Int32]22))
$Button1.TabIndex = [System.Int32]10
$Button1.Text = [System.String]'Show'
$ttAMToolTips.SetToolTip($Button1,[System.String]'Hold to show Default Password.')
$Button1.UseVisualStyleBackColor = $false
#
#lblDefaultPassword
#
$lblDefaultPassword.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]345,[System.Int32]74))
$lblDefaultPassword.Name = [System.String]'lblDefaultPassword'
$lblDefaultPassword.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]22))
$lblDefaultPassword.TabIndex = [System.Int32]9
$lblDefaultPassword.Text = [System.String]'Default Password:'
$lblDefaultPassword.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
#
#txtDefaultPassword
#
$txtDefaultPassword.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtDefaultPassword.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]9,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$txtDefaultPassword.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]451,[System.Int32]74))
$txtDefaultPassword.Name = [System.String]'txtDefaultPassword'
$txtDefaultPassword.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]200,[System.Int32]22))
$txtDefaultPassword.TabIndex = [System.Int32]8
$txtDefaultPassword.UseSystemPasswordChar = $true
#
#btnExportACL
#
$btnExportACL.BackColor = [System.Drawing.Color]::LemonChiffon
$btnExportACL.Enabled = $false
$btnExportACL.FlatAppearance.BorderColor = [System.Drawing.Color]::DimGray
$btnExportACL.FlatAppearance.MouseDownBackColor = [System.Drawing.Color]::LightGreen
$btnExportACL.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::PaleGreen
$btnExportACL.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnExportACL.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]471))
$btnExportACL.Name = [System.String]'btnExportACL'
$btnExportACL.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]65,[System.Int32]22))
$btnExportACL.TabIndex = [System.Int32]7
$btnExportACL.Text = [System.String]'Export'
$btnExportACL.UseVisualStyleBackColor = $false
#
#btnImportACL
#
$btnImportACL.BackColor = [System.Drawing.Color]::LemonChiffon
$btnImportACL.Enabled = $false
$btnImportACL.FlatAppearance.BorderColor = [System.Drawing.Color]::DimGray
$btnImportACL.FlatAppearance.MouseDownBackColor = [System.Drawing.Color]::LightGreen
$btnImportACL.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::PaleGreen
$btnImportACL.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnImportACL.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]636,[System.Int32]471))
$btnImportACL.Name = [System.String]'btnImportACL'
$btnImportACL.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]65,[System.Int32]22))
$btnImportACL.TabIndex = [System.Int32]6
$btnImportACL.Text = [System.String]'Import'
$btnImportACL.UseVisualStyleBackColor = $false
#
#Label1
#
$Label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]9,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]12))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]186,[System.Int32]22))
$Label1.TabIndex = [System.Int32]5
$Label1.Text = [System.String]'Browse for ACL file'
$Label1.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
#
#btnACLBrowse
#
$btnACLBrowse.BackColor = [System.Drawing.Color]::DarkGray
$btnACLBrowse.FlatAppearance.BorderColor = [System.Drawing.Color]::DimGray
$btnACLBrowse.FlatAppearance.MouseDownBackColor = [System.Drawing.Color]::LightGray
$btnACLBrowse.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::LightGray
$btnACLBrowse.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnACLBrowse.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]636,[System.Int32]37))
$btnACLBrowse.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$btnACLBrowse.Name = [System.String]'btnACLBrowse'
$btnACLBrowse.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]65,[System.Int32]22))
$btnACLBrowse.TabIndex = [System.Int32]4
$btnACLBrowse.Text = [System.String]'Browse'
$btnACLBrowse.UseVisualStyleBackColor = $false
#
#txtACLPath
#
$txtACLPath.BackColor = [System.Drawing.Color]::White
$txtACLPath.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtACLPath.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]9,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$txtACLPath.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]37))
$txtACLPath.Name = [System.String]'txtACLPath'
$txtACLPath.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]626,[System.Int32]22))
$txtACLPath.TabIndex = [System.Int32]3
$ttAMToolTips.SetToolTip($txtACLPath,[System.String]'The path must be valid; no whitespaces or special characters (e.g., !@#$%^&). 
A valid path example: ''C:\Users\john.m.doe\Desktop\ACL_File.txt'' without the quotes.')
#
#lblACLLabel
#
$lblACLLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]9,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$lblACLLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]77))
$lblACLLabel.Name = [System.String]'lblACLLabel'
$lblACLLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]297,[System.Int32]22))
$lblACLLabel.TabIndex = [System.Int32]2
$lblACLLabel.Text = [System.String]'Account Control List Preview'
$lblACLLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
#
#lblConsoleSeparator
#
$lblConsoleSeparator.BackColor = [System.Drawing.Color]::Gainsboro
$lblConsoleSeparator.Dock = [System.Windows.Forms.DockStyle]::Bottom
$lblConsoleSeparator.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]496))
$lblConsoleSeparator.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$lblConsoleSeparator.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]3))
$lblConsoleSeparator.Name = [System.String]'lblConsoleSeparator'
$lblConsoleSeparator.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]3))
$lblConsoleSeparator.TabIndex = [System.Int32]1
#
#rtbACLReview
#
$rtbACLReview.AcceptsTab = $true
$rtbACLReview.BackColor = [System.Drawing.Color]::White
$rtbACLReview.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$rtbACLReview.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Consolas',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$rtbACLReview.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]132))
$rtbACLReview.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]3,[System.Int32]0,[System.Int32]3))
$rtbACLReview.Name = [System.String]'rtbACLReview'
$rtbACLReview.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]696,[System.Int32]333))
$rtbACLReview.TabIndex = [System.Int32]0
$rtbACLReview.Text = [System.String]''
#
#pConsolePanel
#
$pConsolePanel.Controls.Add($txtOutput)
$pConsolePanel.Dock = [System.Windows.Forms.DockStyle]::Bottom
$pConsolePanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]499))
$pConsolePanel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$pConsolePanel.Name = [System.String]'pConsolePanel'
$pConsolePanel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5))
$pConsolePanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]156))
$pConsolePanel.TabIndex = [System.Int32]1
#
#txtOutput
#
$txtOutput.BackColor = [System.Drawing.Color]::DimGray
$txtOutput.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtOutput.Dock = [System.Windows.Forms.DockStyle]::Fill
$txtOutput.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Consolas',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$txtOutput.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]5))
$txtOutput.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$txtOutput.Name = [System.String]'txtOutput'
$txtOutput.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]696,[System.Int32]146))
$txtOutput.TabIndex = [System.Int32]0
$txtOutput.Text = [System.String]''
#
#pFrameworkBottomPanel
#
$pFrameworkBottomPanel.AutoSize = $true
$pFrameworkBottomPanel.BackColor = [System.Drawing.Color]::White
$pFrameworkBottomPanel.Controls.Add($ssStatus)
$pFrameworkBottomPanel.Controls.Add($lblStatusSeparator)
$pFrameworkBottomPanel.Dock = [System.Windows.Forms.DockStyle]::Bottom
$pFrameworkBottomPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]655))
$pFrameworkBottomPanel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$pFrameworkBottomPanel.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]23))
$pFrameworkBottomPanel.Name = [System.String]'pFrameworkBottomPanel'
$pFrameworkBottomPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]23))
$pFrameworkBottomPanel.TabIndex = [System.Int32]5
#
#ssStatus
#
$ssStatus.BackColor = [System.Drawing.Color]::White
$ssStatus.Items.AddRange([System.Windows.Forms.ToolStripItem[]]@($lblStatus))
$ssStatus.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]1))
$ssStatus.Name = [System.String]'ssStatus'
$ssStatus.ShowItemToolTips = $true
$ssStatus.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]22))
$ssStatus.TabIndex = [System.Int32]2
$ssStatus.Text = [System.String]'ssStatus'
#
#lblStatus
#
$lblStatus.DisplayStyle = [System.Windows.Forms.ToolStripItemDisplayStyle]::Text
$lblStatus.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$lblStatus.Name = [System.String]'lblStatus'
$lblStatus.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10,[System.Int32]0,[System.Int32]10,[System.Int32]0))
$lblStatus.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]691,[System.Int32]22))
$lblStatus.Spring = $true
$lblStatus.Text = [System.String]'NOTICE: Status Message'
$lblStatus.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
#
#lblStatusSeparator
#
$lblStatusSeparator.BackColor = [System.Drawing.Color]::Gainsboro
$lblStatusSeparator.Dock = [System.Windows.Forms.DockStyle]::Fill
$lblStatusSeparator.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$lblStatusSeparator.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$lblStatusSeparator.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]3,[System.Int32]0,[System.Int32]0))
$lblStatusSeparator.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]1))
$lblStatusSeparator.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]1))
$lblStatusSeparator.Name = [System.String]'lblStatusSeparator'
$lblStatusSeparator.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]1))
$lblStatusSeparator.TabIndex = [System.Int32]4
#
#msMainMenu
#
$msMainMenu.BackColor = [System.Drawing.Color]::White
$msMainMenu.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::None
$msMainMenu.Items.AddRange([System.Windows.Forms.ToolStripItem[]]@($miFile,$miEdit,$miHelp,$txtCurrentUser))
$msMainMenu.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$msMainMenu.Name = [System.String]'msMainMenu'
$msMainMenu.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]24))
$msMainMenu.TabIndex = [System.Int32]1
$msMainMenu.Text = [System.String]'msMainMenu'
#
#miFile
#
$miFile.BackColor = [System.Drawing.Color]::Transparent
$miFile.DisplayStyle = [System.Windows.Forms.ToolStripItemDisplayStyle]::Text
$miFile.DropDownItems.AddRange([System.Windows.Forms.ToolStripItem[]]@($miExit))
$miFile.Name = [System.String]'miFile'
$miFile.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]37,[System.Int32]20))
$miFile.Text = [System.String]'File'
#
#miExit
#
$miExit.BackColor = [System.Drawing.Color]::Transparent
$miExit.Name = [System.String]'miExit'
$miExit.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]92,[System.Int32]22))
$miExit.Text = [System.String]'Exit'
#
#miEdit
#
$miEdit.BackColor = [System.Drawing.Color]::Transparent
$miEdit.DisplayStyle = [System.Windows.Forms.ToolStripItemDisplayStyle]::Text
$miEdit.DropDownItems.AddRange([System.Windows.Forms.ToolStripItem[]]@($miACLProperties))
$miEdit.Name = [System.String]'miEdit'
$miEdit.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]39,[System.Int32]20))
$miEdit.Text = [System.String]'Edit'
#
#miACLProperties
#
$miACLProperties.BackColor = [System.Drawing.Color]::Transparent
$miACLProperties.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::None
$miACLProperties.DisplayStyle = [System.Windows.Forms.ToolStripItemDisplayStyle]::Text
$miACLProperties.Enabled = $false
$miACLProperties.Name = [System.String]'miACLProperties'
$miACLProperties.ShortcutKeyDisplayString = [System.String]''
$miACLProperties.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]161,[System.Int32]22))
$miACLProperties.Text = [System.String]'ACL Properties...'
$miACLProperties.ToolTipText = [System.String]'Work In Progress'
#
#miHelp
#
$miHelp.BackColor = [System.Drawing.Color]::Transparent
$miHelp.DisplayStyle = [System.Windows.Forms.ToolStripItemDisplayStyle]::Text
$miHelp.DropDownItems.AddRange([System.Windows.Forms.ToolStripItem[]]@($miAbout))
$miHelp.Name = [System.String]'miHelp'
$miHelp.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]44,[System.Int32]20))
$miHelp.Text = [System.String]'Help'
#
#miAbout
#
$miAbout.BackColor = [System.Drawing.Color]::Transparent
$miAbout.DisplayStyle = [System.Windows.Forms.ToolStripItemDisplayStyle]::Text
$miAbout.Name = [System.String]'miAbout'
$miAbout.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]107,[System.Int32]22))
$miAbout.Text = [System.String]'About'
#
#txtCurrentUser
#
$txtCurrentUser.Alignment = [System.Windows.Forms.ToolStripItemAlignment]::Right
$txtCurrentUser.AutoToolTip = $true
$txtCurrentUser.BackColor = [System.Drawing.Color]::White
$txtCurrentUser.BorderStyle = [System.Windows.Forms.BorderStyle]::None
$txtCurrentUser.CharacterCasing = [System.Windows.Forms.CharacterCasing]::Lower
$txtCurrentUser.Name = [System.String]'txtCurrentUser'
$txtCurrentUser.Overflow = [System.Windows.Forms.ToolStripItemOverflow]::Never
$txtCurrentUser.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]10,[System.Int32]0))
$txtCurrentUser.ReadOnly = $true
$txtCurrentUser.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]220,[System.Int32]20))
$txtCurrentUser.TextBoxTextAlign = [System.Windows.Forms.HorizontalAlignment]::Right
#
#lblMainMenuSeparator
#
$lblMainMenuSeparator.BackColor = [System.Drawing.Color]::Gainsboro
$lblMainMenuSeparator.Dock = [System.Windows.Forms.DockStyle]::Top
$lblMainMenuSeparator.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$lblMainMenuSeparator.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]24))
$lblMainMenuSeparator.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$lblMainMenuSeparator.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]3))
$lblMainMenuSeparator.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]3))
$lblMainMenuSeparator.Name = [System.String]'lblMainMenuSeparator'
$lblMainMenuSeparator.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]3))
$lblMainMenuSeparator.TabIndex = [System.Int32]3
#
#ttAMToolTips
#
$ttAMToolTips.BackColor = [System.Drawing.Color]::LightCyan
$ttAMToolTips.ToolTipTitle = [System.String]'Valid Path'
#
#ttImportButton
#
$ttImportButton.BackColor = [System.Drawing.Color]::LightCyan
$ttImportButton.ToolTipTitle = [System.String]'NOTICE'
#
#AccountManagementTool
#
$AccountManagementTool.BackColor = [System.Drawing.Color]::White
$AccountManagementTool.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]706,[System.Int32]705))
$AccountManagementTool.Controls.Add($pFrameworkPanel)
$AccountManagementTool.Controls.Add($lblMainMenuSeparator)
$AccountManagementTool.Controls.Add($msMainMenu)
$AccountManagementTool.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$AccountManagementTool.MainMenuStrip = $msMainMenu
$AccountManagementTool.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$AccountManagementTool.Text = [System.String]'Account Control List'
$pFrameworkPanel.ResumeLayout($false)
$pFrameworkPanel.PerformLayout()
$pContentFrameworkPanel.ResumeLayout($false)
$pCenterContentPanel.ResumeLayout($false)
$pCenterContentPanel.PerformLayout()
$tsACLReview.ResumeLayout($false)
$tsACLReview.PerformLayout()
$pConsolePanel.ResumeLayout($false)
$pFrameworkBottomPanel.ResumeLayout($false)
$pFrameworkBottomPanel.PerformLayout()
$ssStatus.ResumeLayout($false)
$ssStatus.PerformLayout()
$msMainMenu.ResumeLayout($false)
$msMainMenu.PerformLayout()
$AccountManagementTool.ResumeLayout($false)
$AccountManagementTool.PerformLayout()
Add-Member -InputObject $AccountManagementTool -Name pFrameworkPanel -Value $pFrameworkPanel -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name pContentFrameworkPanel -Value $pContentFrameworkPanel -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name pCenterContentPanel -Value $pCenterContentPanel -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name tsACLReview -Value $tsACLReview -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name ToolStripLabel1 -Value $ToolStripLabel1 -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name tsACLPatternBox -Value $tsACLPatternBox -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name btnValidateFile -Value $btnValidateFile -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name Button1 -Value $Button1 -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name ttAMToolTips -Value $ttAMToolTips -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name components -Value $components -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name lblDefaultPassword -Value $lblDefaultPassword -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name txtDefaultPassword -Value $txtDefaultPassword -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name btnExportACL -Value $btnExportACL -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name btnImportACL -Value $btnImportACL -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name btnACLBrowse -Value $btnACLBrowse -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name txtACLPath -Value $txtACLPath -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name lblACLLabel -Value $lblACLLabel -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name lblConsoleSeparator -Value $lblConsoleSeparator -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name rtbACLReview -Value $rtbACLReview -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name pConsolePanel -Value $pConsolePanel -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name txtOutput -Value $txtOutput -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name pFrameworkBottomPanel -Value $pFrameworkBottomPanel -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name ssStatus -Value $ssStatus -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name lblStatus -Value $lblStatus -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name lblStatusSeparator -Value $lblStatusSeparator -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name msMainMenu -Value $msMainMenu -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name miFile -Value $miFile -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name miExit -Value $miExit -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name miEdit -Value $miEdit -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name miACLProperties -Value $miACLProperties -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name miHelp -Value $miHelp -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name miAbout -Value $miAbout -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name txtCurrentUser -Value $txtCurrentUser -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name lblMainMenuSeparator -Value $lblMainMenuSeparator -MemberType NoteProperty
Add-Member -InputObject $AccountManagementTool -Name ttImportButton -Value $ttImportButton -MemberType NoteProperty
}
. InitializeComponent
