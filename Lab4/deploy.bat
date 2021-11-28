kubectl apply -f .\namespace.yaml
kubectl apply -f .\secret.yaml
kubectl apply -f .\storageclass.yaml -n wordpress-ns
kubectl apply -f .\persistentvolumeclaims.yaml -n wordpress-ns
kubectl apply -f .\services.yaml -n wordpress-ns
kubectl apply -f .\mysqldeployment.yaml -n wordpress-ns
kubectl apply -f .\wordpressdeployment.yaml -n wordpress-ns