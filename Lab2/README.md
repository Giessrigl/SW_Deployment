# Lab2
## Link zu dem in Azure DevOps verwendeten Repo der Node.js App
https://github.com/Giessrigl/Lab2

## Links zu Web App
### Dev
https://christian-giessrigl-lab2.azurewebsites.net/
### Production
https://christian-giessrigl-lab2-release.azurewebsites.net/

## Screenshot der Azure DevOps build/Test/Deploy Pipeline incl.  erfolgreicher und nicht erfolgreicher Deployments
![Pipeline](./Screenshots/Pipeline.JPG)

## Screenshot der Azure DevOps Release Pipeline
### Dev
![Dev](./Screenshots/dev_Release.JPG)

### Production
![Production](./Screenshots/release_Release.JPG)


## Dokumentation wie die Releases freigegeben werden

Auf dev.azure.com im production release oben rechts auf Create Release drücken.
![Create release](./Screenshots/create_release2.jpg)

Damit öffnet sich ein neues Fenster in dem man bestimmen kann welche Drop Version released werden soll.
![Create new release](./Screenshots/create_new_release2.jpg)

Anschließend muss das Deployment noch genehmigt werden. 
Dafür muss auf den ausgegrauten Knopf in der Spalte ,,Stages" gedrückt werden.
![Not deployede](./Screenshots/not_deployed2.jpg)

Im nächsten Bildschirm dann oben auf Deploy klicken. Fertig.
![Deployed](./Screenshots/deploy2.jpg)

## Application Insights
![Application Insights](./Screenshots/release_insights.JPG)
