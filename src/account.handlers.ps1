function Register-UIEvents {
    <#
    .SYNOPSIS
        Registers all event handlers for the Audit Dashboard.
    #>
    param ([System.Windows.Forms.Form]$Form = $AccountManagementTool)

    $Form.Add_FormClosing({
        param(
            $s, 
            $e,
            [System.Windows.Forms.Form]$Form = $AuditToolDashboard
        )

        # $script:IsClosing = $true

        # $AuditToolPreview.Close()
        # # Only prompt if there is actually text in the output log
        # if (-not [string]::IsNullOrWhiteSpace($Form.txtProcessOutput.Text)) {
        #     $Msg = "You have unsaved process logs. Would you like to save the output before exiting?"
        #     $Result = [System.Windows.Forms.MessageBox]::Show($Msg, "Save Log?", "YesNoCancel", "Question")

        #     if ($Result -eq [System.Windows.Forms.DialogResult]::Yes) {
        #         $Form.miSaveProcessOutputLog.PerformClick()
        #     }
        #     elseif ($Result -eq [System.Windows.Forms.DialogResult]::Cancel) {
        #         $e.Cancel = $true
        #     }
        # }
    })

    $Form.miExit.Add_Click({
        $AccountManagementTool.Close()
    })

    $Form.miAbout.Add_Click({
        Invoke-About
    })

    $Form.miACLProperties.Add_Click({
        Invoke-ACLProperties
    })

    $Form.btnImportACL.Add_Click({
        Invoke-ProcessACL
    })

    $Form.btnExportACL.Add_Click({
        Invoke-ExportACL
    })

    $Form.btnACLBrowse.Add_Click({
        Invoke-BrowseACL
    })

    $Form.btnValidateFile.Add_Click({
        Invoke-ValidateFile
    })
}