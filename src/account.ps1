$currentPrincipal           = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$script:IsAdmin             = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
$script:User                = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$script:SelectedUser        = ""
$script:EnableImport        = $false
$script:EnableExport        = $false
$script:IsValid             = $false

Add-Type -AssemblyName System.Windows.Forms
Import-Module Microsoft.PowerShell.LocalAccounts

$Win32Signature = @"
using System;
using System.Runtime.InteropServices;

public class Win32Icons {
    [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    public static extern uint PrivateExtractIcons(
        string lpszFile,
        int nIconIndex,
        int cxIcon,
        int cyIcon,
        IntPtr[] phicon,
        uint[] piconid,
        uint nIcons,
        uint flags
    );

    [DllImport("user32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool DestroyIcon(IntPtr hIcon);
}
"@

Add-Type -TypeDefinition $Win32Signature

. (Join-Path $PSScriptRoot 'account.globals.ps1')
. (Join-Path $PSScriptRoot 'account.designer.ps1')

. (Join-Path $PSScriptRoot 'account.functions.ps1')
. (Join-Path $PSScriptRoot 'account.handlers.ps1')

#regoin Initialization Functins
Register-UIEvents -Form $AccountManagementTool
Start-Application
#endregion

$AccountManagementTool.ShowDialog()