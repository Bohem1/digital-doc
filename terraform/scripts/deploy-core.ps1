$location = 'westeurope'
$resourceGroupName = 'core-build-resources'
$storageAccountName = 'corebuild9834059'
$containerName = 'coretfstate'

#az login

az group create --name $resourceGroupName --location $location
az storage account create --name $storageAccountName --resource-group $resourceGroupName --location $location --sku Standard_LRS
az storage container create --name $containerName --account-name $storageAccountName

$storageAccountKey = az storage account keys list --resource-group $resourceGroupName --account-name $storageAccountName --query '[0].value' -o tsv
$storageAccountKey
