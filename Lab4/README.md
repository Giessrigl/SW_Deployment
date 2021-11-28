# Lab 4
## Followed following guides/ tutorials:
[Microsoft Kubernetes Walkthrough](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)

[Set up WP + MySQL in AKS](https://quisl.de/b/wie-du-wordpress-auf-azure-kubernetes-services-installierst-manuelles-deployment-in-6-schritten/)

## Applied the following changes:

* Ignored the Ingress Controller in [Set up WP + MySQL in AKS](https://quisl.de/b/wie-du-wordpress-auf-azure-kubernetes-services-installierst-manuelles-deployment-in-6-schritten/)

* Used the .bat script in 6th step without the last line (ingress-controller-yaml) and run it in Powershell after:
1. az login
2. az aks get-credentials --resource-group {RG_Name} --name {Cluter_Name}
3. cd {Directory of the files with the .bat script}
4. ./deploy.bat

* To create an external ip address for the wordpress website I had to switch the wordpress service from ClusterIP to LoadBalancer found in this forum discussion:
https://stackoverflow.com/questions/64122513/aks-cluster-created-has-no-external-ip-address

* Lastly I could not establish a database connection when setting up wordpress.
Things I tried:
1. Use a static cluster ip address in services.yaml instead of "None".
2. Use an internal load balancer instead of Cluster IP -> [Internal lb](https://docs.microsoft.com/en-us/azure/aks/internal-lb) and connect wordpress to the "external ip address" of mysql.
3. Use the test database for the Database Name to connect to (in the wordpressdeployment.yaml).
4. Use the external port of the mysql internal loadbalancer instead of the internal (3306) one.

## Annotations
If you want to use kubectl commands you have to change the [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)




https://kubernetes.io/docs/concepts/configuration/secret/