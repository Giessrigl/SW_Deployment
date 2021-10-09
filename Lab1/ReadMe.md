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

  

Afterwards I followed the Microsoft Documentation Quickstart Guide on "Create App Service app using an ARM template" and integrated it into the already existing template.<br>

https://docs.microsoft.com/en-us/azure/app-service/quickstart-arm-template?pivots=platform-linux

  

## Usage

### Commands to deploy:

* Azure CLI:<br>

az deployment group create --name {Deployment-Name} --resource-group {ResourceGroup-Name} --template-file {path to the azuredeploy.json file} --parameters {path to the azuredeploy.parameters.json file}

  

* Powershell:<br>

New-AzResourceGroupDeployment -Name {Deployment-Name} -ResourceGroupName {ResourceGroup-Name} -TemplateFile {path to the azuredeploy.json file} -TemplateParameterFile {path to the azuredeploy.parameters.json file}

  
  

### Parameters:

**storagePrefix:**<br>

&emsp; a prefix for the storage name, concatenates with ID to create a unique storage name. 
&emsp; ID stays the same until resource-group is changed. <br>

**storageSKU:**  <br>

&emsp; the SKU type of the Storage Account <br>

**appServicePlanName:**  <br>

&emsp; the name of the Application-Service-Plan <br>

**resourceTags:**  <br>

&emsp; defines the environment, in which will be deployed (e.g. Dev, Production, ...)  
&emsp; and the Projecttype (in this case an exercise) <br>

**repoUrl:**  <br>

&emsp; the Url of the repository for the Node.js Web App <br>

  

**webAppName:**  <br>

&emsp; the Name of the Webapp, this will be necessary for the URL of the web app<br>

&emsp; ( http://{webAppName}.azurewebsites.net/ )<br>

&emsp; the complete URL will also be mentioned as an output of the deployment <br>

**linuxFxVersion:**  <br>

&emsp; the programming language stack for the web application (default value is Node|10.15) <br>

**location:**<br>

&emsp; the location of the deployed resources  
&emsp; (default value is the location of the resource-group)