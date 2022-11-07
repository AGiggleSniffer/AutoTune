#Create Form
Add-Type -assembly System.Windows.Forms
$Form = New-Object System.Windows.Forms.Form
$Form.Text ='GUI for my PoSh script'
$Form.Width = 600
$Form.Height = 400
$Form.AutoSize = $true

# create your checkbox 
$checkbox1 = new-object System.Windows.Forms.checkbox
$checkbox1.Location = new-object System.Drawing.Size(30,30)
$checkbox1.Size = new-object System.Drawing.Size(250,20)
$checkbox1.Text = "Start DISM/SFC"
$checkbox1.Checked = $false
$Form.Controls.Add($checkbox1) 

$checkbox2 = new-object System.Windows.Forms.checkbox
$checkbox2.Location = new-object System.Drawing.Size(30,60)
$checkbox2.Size = new-object System.Drawing.Size(250,20)
$checkbox2.Text = "Make NOC Folder"
$checkbox2.Checked = $false
$Form.Controls.Add($checkbox2)

$checkbox3 = new-object System.Windows.Forms.checkbox
$checkbox3.Location = new-object System.Drawing.Size(30,90)
$checkbox3.Size = new-object System.Drawing.Size(250,20)
$checkbox3.Text = "Install/Repair NOC Calling Card"
$checkbox3.Checked = $false
$Form.Controls.Add($checkbox3)

$checkbox4 = new-object System.Windows.Forms.checkbox
$checkbox4.Location = new-object System.Drawing.Size(30,120)
$checkbox4.Size = new-object System.Drawing.Size(250,20)
$checkbox4.Text = "Download/Install/Update Tools"
$checkbox4.Checked = $true
$Form.Controls.Add($checkbox4)
#Indented and greyed out if above isnt selected
$checkbox5 = new-object System.Windows.Forms.checkbox
$checkbox5.Location = new-object System.Drawing.Size(40,140)
$checkbox5.Size = new-object System.Drawing.Size(250,20)
$checkbox5.Text = "Run ADWCleaner"
$checkbox5.Checked = $true
$Form.Controls.Add($checkbox5)

$checkbox6 = new-object System.Windows.Forms.checkbox
$checkbox6.Location = new-object System.Drawing.Size(40,160)
$checkbox6.Size = new-object System.Drawing.Size(250,20)
$checkbox6.Text = "Open Malwarebytes"
$checkbox6.Checked = $true
$Form.Controls.Add($checkbox6)

$checkbox7 = new-object System.Windows.Forms.checkbox
$checkbox7.Location = new-object System.Drawing.Size(40,180)
$checkbox7.Size = new-object System.Drawing.Size(250,20)
$checkbox7.Text = "Open Glary Utilities"
$checkbox7.Checked = $true
$Form.Controls.Add($checkbox7)

$checkbox8 = new-object System.Windows.Forms.checkbox
$checkbox8.Location = new-object System.Drawing.Size(40,200)
$checkbox8.Size = new-object System.Drawing.Size(250,20)
$checkbox8.Text = "Open CCleaner"
$checkbox8.Checked = $true
$Form.Controls.Add($checkbox8)
#Greyed out if 'Open CCleaner' is selected
$checkbox9 = new-object System.Windows.Forms.checkbox
$checkbox9.Location = new-object System.Drawing.Size(40,220)
$checkbox9.Size = new-object System.Drawing.Size(250,20)
$checkbox9.Text = "Start Auto Temp File Cleaner with CCleaner"
$checkbox9.Checked = $false
$Form.Controls.Add($checkbox9)

$checkbox10 = new-object System.Windows.Forms.checkbox
$checkbox10.Location = new-object System.Drawing.Size(30,250)
$checkbox10.Size = new-object System.Drawing.Size(250,20)
$checkbox10.Text = "Install UBlock Origin to Edge/Chrome"
$checkbox10.Checked = $true
$Form.Controls.Add($checkbox10)

$buttonComputerName_Click = {
    $textboxResults.Text = $env:ComputerName
}


$OKButton = new-object System.Windows.Forms.Button
$OKButton.Location = new-object System.Drawing.Size(450,350)
$OKButton.Size = new-object System.Drawing.Size(100,40)
$OKButton.Text = "OK"
$OKButton.Add_Click({$Form.Close()})
$form.Controls.Add($OKButton)

$CancelButton = new-object System.Windows.Forms.Button
$CancelButton.Location = new-object System.Drawing.Size(350,350)
$CancelButton.Size = new-object System.Drawing.Size(100,40)
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({$Form.Close()})
$form.Controls.Add($CancelButton)

$Form.ShowDialog()