# Connect to Azure Subscription
Login-AzureRmAccount

# Variables
$rgname = 'msc-Lab'
$location = 'West Europe'

# Deploy environment
New-AzureRmResourceGroup -Name $rgname -Location $location -Verbose

# Variante local
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateParameterFile E:\Lab\mscLab.param.json -TemplateFile E:\Lab\mscLab.json -Verbose

# Variante GitHub
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateParameterUri 'https://github.com/schmitzmichael/AzureRM/tree/master/myLab/mscLab.param.json'-TemplateUri 'https://github.com/schmitzmichael/AzureRM/tree/master/myLab/mscLab.json' -Verbose


# Find the VM IP and FQDN
$PublicAddress = (Get-AzureRmPublicIpAddress -ResourceGroupName $rgname)[0]
$IP   = $PublicAddress.IpAddress
$FQDN = $PublicAddress.DnsSettings.Fqdn

# RDP either way
Start-Process -FilePath mstsc.exe -ArgumentList "/v:$FQDN"
Start-Process -FilePath mstsc.exe -ArgumentList "/v:$IP"


# Shutdown the VM(s) for the night
Get-AzureRMVM -ResourceGroupName $rgname | Stop-AzureRMVM

# Delete the entire resource group when finished
Remove-AzureRmResourceGroup -Name $rgname -Force -Verbose
