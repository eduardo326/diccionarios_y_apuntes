
minikube start
minikube start --driver=virtualbox
minikube start --driver=hyperv 
minikube stop
minikube status
minikube service ingress-nginx -n ingress-nginx --url
minikube service eureka -n prod-back --url
minikube dashboard



kubectl describe node mikube  ## Mestra de talles de un nodo memoria, cpu, etc...

##SOLUCION ERROR Exiting due to HOST JUJU LOCK PERMISSION
rm /tmp/juju-*


# eliminar servicio
kubectl delete service hello-world  

kubectl api-versions
kubectl api-resources

kubectl get pods -A -o wide

kubectl port-forward service/nombreservicio -n namespace  # Para crear un tunel para consumir un servicio expuesto por local

kubectl get pods   #muestra todos los pods
kubectl get pods -l app=mifront -o wide # Mustra los pods con mas detalles
kubectl get pod nombrepods  #Muestra el pod indicado
kubectl get pod nombrepods -o yaml  #Muestra el pod indicado con todo el detalle de manifiest
kubectl describe pod nombrepod # Muestra la infomracion mas relevante del pod
kubectl delete pod nombrepod1 nombrepod2  #Eliminar pods

kubectl run --generator=run-pod/v1 nombrepod --image=nginx:alpine  #Crear pod
kubectl exec -ti nombrepod -- sh #Ingresar a un contenedor de un pod cuando el pod solo tiene un contenerdor
kubectl exec -ti nombrepod -c nombrecontenedor -- sh #Ingresar a un contenedor de un pod cuando el pod tiene muchos contenerdores
kubectl logs nombrepod -f #Ver los logs de un contendor en un pod con un solo conetenedor
kubectl logs nombrepod -c nombrecontenedor #Ver los logs de un contenedor en un pod con muchos contenedores


kubectl apply -f pod.yaml  #Crea pods a partir de archivo .yaml
kubectl delete -f pod.yaml #Elimina pods a partir de archivo .yaml

kubectl get pods --watch  #Ver si termino el proceso de creacion

kubectl get replicaset  #Lista los replicaset
kubectl get replicaset nombrers -o yaml
kubectl get replicaset -l  # Ver todos los replicas set creado en la historia

kubectl rollout status deployment nombreDeployment  #Con esto se puede ver los evento en linea cuando se actualiza un deploymente
kubectl describe deployment.apps nombreDeployment   #Se pueden ver todos los eventos que se han generado en un Deployment
kubectl rollout history deployment nombreDeployment  #Muestra el historial de actualizaciones del deployment (Revisiones)
kubectl rollout history deployment nombreDeployment --revision=#revision   #muestra el detalle de una revision
kubectl rollout undo deployment nombreDeployment --to-revision=#revisio   #Devuelve la actualizacion a la revision indicada (Rollback)

kubectl get deployment --show-labels
kubectl get deploy
kubectl get deploy -n mynamespace

#Services
kubectl describe svc miervicio
kubectl get svc -l app=front
kubectl get svc -n mynamespace

kubectl get endpoints


kubectl get namespaces
kubectl get all -n nombreNamespace
kubectl create namespace mynamespace
kubectl describe namespaces mynamespace
kubectl get pods mynamespace


#Manejar los conextos
kubectl config view
kubectl config set-context ci-context --namespaces=ci --cluster=minikube --user=minikube
kubectl config use-context mycontext


#QoS Classes
##Guaranteed request=limit
##Burstable  limit>request
##BestEffort  no tiene request ni limit
kubectl get pod mypod -o yaml | grep -i qos

#LimitRange
kubectl get limitrange -n minamespace
kubectl describe limitrange mylimitrange -n dev

#ResourceQuota
kubectl describe resourcequotas - mynamespace myresourcequota


#PVC/PV
kubectl get pv
kubectl describe pv mypv
kubectl edit pv mypv

kubectl get pvc


kubectl get sc  ## Storage Class


#AUtenticacion RBAC
kubectl config view   #Certific Autorite
kubectl config current-context ## Ver con que usuario estoy trabjando en kubernetes

kubectl cluster-info  #Ver donde esta corriendo el clo ster
kubectl config use-context myusuario #Esto es para cambiar de usuario o conexto
kubectl config get-contexts #Muestra todos los usuarios o contextos configurados en local
kubectl get clusterroles

kubectl get roles
kubectl get rolebindig
kubectl describe rolebindig nombrerolebinding



kubectl api-resources

#ServiceAcount
kubectl get sa # Muestra los service acount
kubectl get sa default -o yaml

kubectl get serviceaccount
kubectl describe serviceaccount nombreservice -o yaml  ##Ver detalle de objeto
kubectl get secrets

#Ingress

minikube service nombreServicio --url -n nombreNamespace #Consultar la ip y puerto espuesto

kubectl get ingress/ingress-2048 -n game-2048

kubectl get ingress -n prod-front