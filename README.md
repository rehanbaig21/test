Clone this Repo locally 


**Build Jenkins in Kubernetes:

ASSUMPTION: the deployment of jenkins using help has an assumption that we have ISTIO  installed in our cluster

Run following command from the root of clone repo which will deploy, Deployment, Service and Virtual service for istio

helm upgrade --install jenkins ./jenkinscharts/jenkins -n default

this will deploy jenkins service, type kubectl get svc jenkins -o yaml -n default  and look for hostname , following will be the output

apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  creationTimestamp: "2021-05-16T08:05:57Z"
  generation: 1
  name: jenkins-vs
  namespace: default
spec:
  gateways:
  - istio-system/preprod-gateway
  hosts:
  - jenkins-test.example.com
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: jenkins.default.svc.cluster.local
        port:
          number: 8085
open browser and type jenkins-test.example.com which will open jenkins , type username and password

**Steps to Build Docker image using Jenkins

Important: make sure Dockerfile and Jenkinsfile is on the root of your repo

Go to Jenkins home page and select --> newitem --> Select Pipeline --> Name the pipeline

once you click ok, new project will be created by the name you provided

Click on Configure and than on the pipeline section paste the URL of your git repo where the projects resides
repo: https://github.com/rehanbaig/test.git
Selec the right branch: master
under script path pass : ./Jenkins

save the configuration and go on the root of your project and click build,

This will build the image which will copy the sample war file and palce under webapp inside tomcat image/container 




