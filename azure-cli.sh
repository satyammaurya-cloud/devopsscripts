#STEP-1: Installing Azure CLI in local windows machine

winget install Microsoft.AzureCLI
winget install --exact --id Microsoft.AzureCLI

#Verify-2: login and verify

az login --use-device-code #[Open the Link on the browser and give code]
az --version
az account show

#STEP-3: to Install Azure CLI insilde ubuntu VM to access storage account

sudo apt update && sudo apt upgrade -y
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
