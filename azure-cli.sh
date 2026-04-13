#STEP-1: Installing Azure CLI

winget install Microsoft.AzureCLI
winget install --exact --id Microsoft.AzureCLI

#Login Method-2: provide azure login

az login --use-device-code #[Open the Link on the browser and give code]

#Verify-3:
az account show

#STEP-4: to Install Azure CLI insilde ubuntu VM to access storage account

sudo apt update && sudo apt upgrade -y
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az --version
#az login --use-device-code   [Open the Link on the browser and give code]
