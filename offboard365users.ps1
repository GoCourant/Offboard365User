<# 
.SYNOPSIS
    GUI for a collection of scripts to offboard a single M365 user account

.DESCRIPTION
    This script will offboard a single Microsoft 365 user account. It has 
    options for blocking sign in, signing out of all current sessions, 
    removing membership from all Teams, removing membership from all groups,
    converting to shared mailbox, hiding the user address from the Global
    Address List, as well as removing all licenses. All actions are displayed
    in the output window for logging/tracking purposes.

.NOTES
    File Name           :offboard365users.ps1
    Author              :Chien Nguyen (chien@gocourant.com)
    Current Version     :0.9.5b
    Copyright           :GNU General Public Licenses


#>
if ($null -eq (Get-InstalledModule -Name "Microsoft.Graph")) {
    Install-Module -Name Microsoft.Graph
} 

if ($null -eq (Get-InstalledModule -Name "ExchangeOnlineManagement")) {
    Install-Module -Name ExchangeOnlineManagement
}

Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Users.Actions
Import-Module Microsoft.Graph.Groups
Import-Module ExchangeOnlineManagement

$chkDistroGroups_CheckedChanged = {
	$btnExecute.enabled         = $true
}
$chkGAL_CheckedChanged = {
	$btnExecute.enabled         = $true
}
$chkSharedMailbox_CheckedChanged = {
	$btnExecute.enabled         = $true
}
$chkLicenses_CheckedChanged = {
	$btnExecute.enabled         = $true
}
$chkBlockSignIn_CheckedChanged = {
	$btnExecute.enabled         = $true
}

$chkTeams_CheckedChanged = {
	$btnExecute.enabled         = $true
}
$btnExecute_Click = {
    $txtOutput.Clear()
    $UPN = $txtUPN.Text
    $UserID = (Get-MgUser -UserId $UPN).Id
    $OffboardingDN = (Get-EXOMailbox -Identity $UPN -IncludeInactiveMailbox).DistinguishedName

    if ($chkBlockSignIn.checked){
        $txtOutput.AppendText("`r`nLogging out of all sessions and blocking sign in for $UPN...")
        Update-MgUser -UserId $UserID -AccountEnabled:$false
        Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/v1.0/users/$UserID/revokeSignInSessions" -Method POST
        $chkBlockSignIn.checked = $false
        $chkBlockSignIn.enabled = $false
    }

    if ($chkTeams.checked){
        $txtOutput.AppendText("`r`nRemoving $UPN from all Teams...")
        Get-MgUserMemberOf -UserId $UserID -All | Where-Object {$_.AdditionalProperties["groupTypes"] -eq "Unified"} | foreach-object {
            Remove-MgGroupMemberByRef -GroupId $_.Id -DirectoryObjectId $UserID
        }
        $chkTeams.checked = $false
        $chkTeams.enabled = $false
    }

    if ($chkDistroGroups.checked){
        $txtOutput.AppendText("`r`nRemoving $UPN from all distribution groups...")
        Get-EXORecipient -Filter "Members -eq '$OffboardingDN'" -RecipientTypeDetails 'MailUniversalDistributionGroup', 'MailUniversalSecurityGroup' | foreach-object {
            Remove-DistributionGroupMember -Identity $_.ExternalDirectoryObjectId -Member $OffboardingDN -BypassSecurityGroupManagerCheck -Confirm:$false
        }
        $chkDistroGroups.checked = $false
        $chkDistroGroups.enabled = $false
    }

    if ($chkGAL.checked){
        $txtOutput.AppendText("`r`nHiding $UPN from the Global Address List...")
        Set-Mailbox $UPN -HiddenFromAddressListsEnabled $true
        $chkGAL.checked = $false
        $chkGAL.enabled = $false
    }

    if ($chkSharedMailbox.checked){
        $txtOutput.AppendText("`r`nConverting $UPN to a shared mailbox...")
        Set-Mailbox $UPN -Type Shared
        $chkSharedMailbox.checked = $false
        $chkSharedMailbox.enabled = $false
    }

    if ($chkLicenses.checked){
        $txtOutput.AppendText("`r`nRemoving all licenses from $UPN...")
        $UserLicenses = (Get-MgUserLicenseDetail -UserID $UserID).SkuId
        Set-MgUserLicense -UserId $UserID -RemoveLicenses $UserLicenses -AddLicenses @()

        $chkLicenses.checked = $false
        $chkLicenses.enabled = $false
    }

    $txtOutput.AppendText("`r`n$UPN has been offboarded")
    $btnExecute.enabled = $false
    Disconnect-MgGraph
    Disconnect-ExchangeOnline
}
$btnM365_Click = {
    $txtOutput.Text             = "Connecting to Microsoft 365 Exchange Online...."
    Connect-ExchangeOnline
    $chkDistroGroups.enabled    = $true
    $chkGAL.enabled             = $true
    $chkSharedMailbox.enabled   = $true
    $txtOutput.AppendText("`r`nMicrosoft 365 Exchange Online Connected")
}
$btnGraph_Click = {
    $txtOutput.Text             = "Connecting to Microsoft Graph..."
    Connect-MgGraph -Scopes "User.ReadWrite.All","Organization.Read.All","Group.ReadWrite.All","GroupMember.ReadWrite.All","TeamMember.ReadWrite.All"
    Select-MgProfile beta
    $chkBlockSignIn.enabled     = $true
    $chkTeams.enabled           = $true
    $chkLicenses.enabled        = $true
    $txtOutput.AppendText("`r`nMicrosoft Graph Connected")
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot\Resources 'offboard365users.designer.ps1')
$Offboard365User.ShowDialog()
