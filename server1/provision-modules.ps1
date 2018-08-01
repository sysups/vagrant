# this script is started by vagrant during the provisioning
# it installs the needed powershell dsc modules used in
# the powershell DSC configuation file "provision-dsc.ps1"

Install-Module -Name xComputerManagement -force
Install-Module -Name NetworkingDsc -force