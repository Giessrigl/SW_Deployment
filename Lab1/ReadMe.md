# Lab1

This is the first exercise of the Software Deployment course in the 5th semester of my bachelor in computer science degree.
The task is to deploy an ARM template to Azure including:
* an Azure Storage Account
* an Azure Web App for Node.js

## Azure Storage Account

I followed precisely the first Microsoft Documentation Tutorial (Beginner JSON templates) to create an ARM template for a storage account.<br>
https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-cli

Altough I skipped "8 - Use Quickstart template" in this process.

## Azure Web App for Node.js (including an Application-Service-Plan)

Afterwards I followed the Microsoft Documentation Quickstart Guide on "Create App Service app using an ARM template" and integrated 
it into the already existing template.<br>
https://docs.microsoft.com/en-us/azure/app-service/quickstart-arm-template?pivots=platform-linux

## Usage
### Commands to deploy:
* Azure CLI:<br>
    az deployment group create --name {Deployment-Name} --resource-group {ResourceGroup-Name} --template-file {path to the azuredeploy.json file} --parameters {path to the azuredeploy.parameters.json file}

* Powershell:<br>
    New-AzResourceGroupDeployment -Name {Deployment-Name} -ResourceGroupName {ResourceGroup-Name} -TemplateFile {path to the azuredeploy.json file} -TemplateParameterFile {path to the azuredeploy.parameters.json file}


### Parameters:
* storagePrefix:          a prefix for the storage name, concatenates with ID to create a unique storage name. ID stays the same until
                            resource-group is changed
* storageSKU:             the SKU type of the Storage Account
* appServicePlanName:     the name of the Application-Service-Plan
* resourceTags:           defines the environment, in which will be deployed (e.g. Dev, Production, ...)
                            and the Projecttype (in this case an exercise)
* repoUrl:                the Url of the repository for the Node.js Web App

* webAppName:             the Name of the Webapp, this will be necessary for the URL of the web app<br> 
                            ( http://{webAppName}.azurewebsites.net/ )<br>
                            the complete URL will also be mentioned as an output of the deployment
* linuxFxVersion:         the programming language stack for the web application (default value is Node|10.15)
* location:               the location of the deployed resources (default value is the location of the resource-group)