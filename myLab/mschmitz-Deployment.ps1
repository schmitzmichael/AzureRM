# Connect to Azure Subscription
Add-AzureRmAccount

# Variables
$rgname = 'msc-Lab'
$location = 'West Europe'

$URIConf   = 'https://raw.githubusercontent.com/schmitzmichael/AzureRM/master/myLab/mscLab.json'
$URIParam  = 'https://raw.githubusercontent.com/schmitzmichael/AzureRM/master/myLab/mscLab.param.json'
$PathConf  = 'E:\Lab\mscLab.json'
$PathParam = 'E:\Lab\mscLab.param.json'
$DeployName = 'Schmitz'


# Deploy environment
New-AzureRmResourceGroup -Name $rgname -Location $location -Verbose



# Splat the parameters on New-AzureRmResourceGroupDeployment  
$SplatParams = @{
    TemplateUri             = $URIConf 
    ResourceGroupName       = $rgname 
    TemplateParameterURI    = $URIParam
    Name                    = $DeployName
}

$SplatParams = @{
    TemplateFile            = $PathConf 
    ResourceGroupName       = $rgname 
    TemplateParameterFile   = $PathParam
    Name                    = $DeployName
}

New-AzureRmResourceGroupDeployment @SplatParams -Verbose

# Variante local
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateParameterFile $PathParam -TemplateFile $PathConf -Name $DeployName -Verbose

# Variante GitHub
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateParameterUri $URIParam -TemplateUri $URIConf -Verbose



# Shutdown the VM(s) for the night
Get-AzureRMVM -ResourceGroupName $rgname | Stop-AzureRMVM

# Delete the entire resource group when finished
Remove-AzureRmResourceGroup -Name $rgname -Force -Verbose
