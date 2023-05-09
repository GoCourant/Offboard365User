$Offboard365User = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$lblUpn = $null
[System.Windows.Forms.TextBox]$txtUPN = $null
[System.Windows.Forms.GroupBox]$GroupBox1 = $null
[System.Windows.Forms.CheckBox]$chkLicenses = $null
[System.Windows.Forms.CheckBox]$chkTeams = $null
[System.Windows.Forms.CheckBox]$chkBlockSignIn = $null
[System.Windows.Forms.Button]$btnGraph = $null
[System.Windows.Forms.GroupBox]$GroupBox2 = $null
[System.Windows.Forms.CheckBox]$chkSharedMailbox = $null
[System.Windows.Forms.CheckBox]$chkGAL = $null
[System.Windows.Forms.CheckBox]$chkDistroGroups = $null
[System.Windows.Forms.Button]$btnM365 = $null
[System.Windows.Forms.TextBox]$txtOutput = $null
[System.Windows.Forms.Button]$btnExecute = $null
function InitializeComponent
{
$lblUpn = (New-Object -TypeName System.Windows.Forms.Label)
$txtUPN = (New-Object -TypeName System.Windows.Forms.TextBox)
$GroupBox1 = (New-Object -TypeName System.Windows.Forms.GroupBox)
$chkLicenses = (New-Object -TypeName System.Windows.Forms.CheckBox)
$chkTeams = (New-Object -TypeName System.Windows.Forms.CheckBox)
$chkBlockSignIn = (New-Object -TypeName System.Windows.Forms.CheckBox)
$btnGraph = (New-Object -TypeName System.Windows.Forms.Button)
$GroupBox2 = (New-Object -TypeName System.Windows.Forms.GroupBox)
$chkSharedMailbox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$chkGAL = (New-Object -TypeName System.Windows.Forms.CheckBox)
$chkDistroGroups = (New-Object -TypeName System.Windows.Forms.CheckBox)
$btnM365 = (New-Object -TypeName System.Windows.Forms.Button)
$txtOutput = (New-Object -TypeName System.Windows.Forms.TextBox)
$btnExecute = (New-Object -TypeName System.Windows.Forms.Button)
$GroupBox1.SuspendLayout()
$GroupBox2.SuspendLayout()
$Offboard365User.SuspendLayout()
#
#lblUpn
#
$lblUpn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]2,[System.Int32]21))
$lblUpn.Name = [System.String]'lblUpn'
$lblUpn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]136,[System.Int32]23))
$lblUpn.TabIndex = [System.Int32]0
$lblUpn.Text = [System.String]'Enter Email Address:'
#
#txtUPN
#
$txtUPN.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtUPN.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]113,[System.Int32]18))
$txtUPN.Name = [System.String]'txtUPN'
$txtUPN.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]410,[System.Int32]21))
$txtUPN.TabIndex = [System.Int32]1
#
#GroupBox1
#
$GroupBox1.Controls.Add($chkLicenses)
$GroupBox1.Controls.Add($chkTeams)
$GroupBox1.Controls.Add($chkBlockSignIn)
$GroupBox1.Controls.Add($btnGraph)
$GroupBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]70))
$GroupBox1.Name = [System.String]'GroupBox1'
$GroupBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]204,[System.Int32]182))
$GroupBox1.TabIndex = [System.Int32]2
$GroupBox1.TabStop = $false
$GroupBox1.Text = [System.String]'Microsoft Graph'
#
#chkLicenses
#
$chkLicenses.Enabled = $false
$chkLicenses.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]152))
$chkLicenses.Name = [System.String]'chkLicenses'
$chkLicenses.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]154,[System.Int32]24))
$chkLicenses.TabIndex = [System.Int32]4
$chkLicenses.Text = [System.String]'Remove all licenses'
$chkLicenses.UseVisualStyleBackColor = $true
$chkLicenses.add_CheckedChanged($chkLicenses_CheckedChanged)
#
#chkTeams
#
$chkTeams.Enabled = $false
$chkTeams.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]104))
$chkTeams.Name = [System.String]'chkTeams'
$chkTeams.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]183,[System.Int32]24))
$chkTeams.TabIndex = [System.Int32]3
$chkTeams.Text = [System.String]'Remove from all Teams'
$chkTeams.UseVisualStyleBackColor = $true
$chkTeams.add_CheckedChanged($chkTeams_CheckedChanged)
#
#chkBlockSignIn
#
$chkBlockSignIn.Enabled = $false
$chkBlockSignIn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]49))
$chkBlockSignIn.Name = [System.String]'chkBlockSignIn'
$chkBlockSignIn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]183,[System.Int32]40))
$chkBlockSignIn.TabIndex = [System.Int32]1
$chkBlockSignIn.Text = [System.String]'Log Out of All Locations and Block Sign-In'
$chkBlockSignIn.UseVisualStyleBackColor = $true
$chkBlockSignIn.add_CheckedChanged($chkBlockSignIn_CheckedChanged)
#
#btnGraph
#
$btnGraph.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]20))
$btnGraph.Name = [System.String]'btnGraph'
$btnGraph.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]168,[System.Int32]23))
$btnGraph.TabIndex = [System.Int32]0
$btnGraph.Text = [System.String]'Connect to Microsoft Graph'
$btnGraph.UseVisualStyleBackColor = $true
$btnGraph.add_Click($btnGraph_Click)
#
#GroupBox2
#
$GroupBox2.Controls.Add($chkSharedMailbox)
$GroupBox2.Controls.Add($chkGAL)
$GroupBox2.Controls.Add($chkDistroGroups)
$GroupBox2.Controls.Add($btnM365)
$GroupBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]222,[System.Int32]70))
$GroupBox2.Name = [System.String]'GroupBox2'
$GroupBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]218,[System.Int32]182))
$GroupBox2.TabIndex = [System.Int32]3
$GroupBox2.TabStop = $false
$GroupBox2.Text = [System.String]'Microsoft 365'
#
#chkSharedMailbox
#
$chkSharedMailbox.Enabled = $false
$chkSharedMailbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]16,[System.Int32]155))
$chkSharedMailbox.Name = [System.String]'chkSharedMailbox'
$chkSharedMailbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]196,[System.Int32]19))
$chkSharedMailbox.TabIndex = [System.Int32]3
$chkSharedMailbox.Text = [System.String]'Convert to shared mailbox'
$chkSharedMailbox.UseVisualStyleBackColor = $true
$chkSharedMailbox.add_CheckedChanged($chkSharedMailbox_CheckedChanged)
#
#chkGAL
#
$chkGAL.Enabled = $false
$chkGAL.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]16,[System.Int32]100))
$chkGAL.Name = [System.String]'chkGAL'
$chkGAL.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]196,[System.Int32]32))
$chkGAL.TabIndex = [System.Int32]2
$chkGAL.Text = [System.String]'Hide from Global Address List'
$chkGAL.UseVisualStyleBackColor = $true
$chkGAL.add_CheckedChanged($chkGAL_CheckedChanged)
#
#chkDistroGroups
#
$chkDistroGroups.Enabled = $false
$chkDistroGroups.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]16,[System.Int32]53))
$chkDistroGroups.Name = [System.String]'chkDistroGroups'
$chkDistroGroups.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]196,[System.Int32]24))
$chkDistroGroups.TabIndex = [System.Int32]1
$chkDistroGroups.Text = [System.String]'Remove from all groups'
$chkDistroGroups.UseVisualStyleBackColor = $true
$chkDistroGroups.add_CheckedChanged($chkDistroGroups_CheckedChanged)
#
#btnM365
#
$btnM365.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]16,[System.Int32]20))
$btnM365.Name = [System.String]'btnM365'
$btnM365.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]182,[System.Int32]23))
$btnM365.TabIndex = [System.Int32]0
$btnM365.Text = [System.String]'Connect to Microsoft 365'
$btnM365.UseVisualStyleBackColor = $true
$btnM365.add_Click($btnM365_Click)
#
#txtOutput
#
$txtOutput.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtOutput.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]2,[System.Int32]258))
$txtOutput.Multiline = $true
$txtOutput.Name = [System.String]'txtOutput'
$txtOutput.ReadOnly = $true
$txtOutput.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]521,[System.Int32]184))
$txtOutput.TabIndex = [System.Int32]4
#
#btnExecute
#
$btnExecute.Enabled = $false
$btnExecute.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]11,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$btnExecute.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]446,[System.Int32]119))
$btnExecute.Name = [System.String]'btnExecute'
$btnExecute.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]89))
$btnExecute.TabIndex = [System.Int32]5
$btnExecute.Text = [System.String]'Execute Actions'
$btnExecute.UseVisualStyleBackColor = $true
$btnExecute.add_Click($btnExecute_Click)
#
#Offboard365User
#
$Offboard365User.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]526,[System.Int32]445))
$Offboard365User.Controls.Add($btnExecute)
$Offboard365User.Controls.Add($txtOutput)
$Offboard365User.Controls.Add($GroupBox2)
$Offboard365User.Controls.Add($GroupBox1)
$Offboard365User.Controls.Add($txtUPN)
$Offboard365User.Controls.Add($lblUpn)
$Offboard365User.Text = [System.String]'Offboard 365 User'
$GroupBox1.ResumeLayout($false)
$GroupBox2.ResumeLayout($false)
$Offboard365User.ResumeLayout($false)
$Offboard365User.PerformLayout()
Add-Member -InputObject $Offboard365User -Name lblUpn -Value $lblUpn -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name txtUPN -Value $txtUPN -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name GroupBox1 -Value $GroupBox1 -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name chkLicenses -Value $chkLicenses -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name chkTeams -Value $chkTeams -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name chkBlockSignIn -Value $chkBlockSignIn -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name btnGraph -Value $btnGraph -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name GroupBox2 -Value $GroupBox2 -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name chkSharedMailbox -Value $chkSharedMailbox -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name chkGAL -Value $chkGAL -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name chkDistroGroups -Value $chkDistroGroups -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name btnM365 -Value $btnM365 -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name txtOutput -Value $txtOutput -MemberType NoteProperty
Add-Member -InputObject $Offboard365User -Name btnExecute -Value $btnExecute -MemberType NoteProperty
}
. InitializeComponent
