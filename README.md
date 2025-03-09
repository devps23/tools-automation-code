# practice-terraform

how to install jenkins?
* https://pkg.jenkins.io/redhat-stable/jenkins.repo
jenkins.repo 
============
  [jenkins]
  name=Jenkins-stable
  baseurl=http://pkg.jenkins.io/redhat-stable
  gpgcheck=1

the above jenkins.repo file is added in /etc/yum.repos.d
* rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
*  yum install fontconfig java-17-openjdk -y
*  yum install jenkins
* systemctl daemon-reload
* systemctl enable jenkins
* systemctl start jenkins
* systemctl status jenkins
the above steps are used to add jenkins repo file to install jenkins

open the jenkins dashboard with public ip address with port 8080
cat /var/lib/jenkins/secrets/initialAdminPassword

SingleBranch Pipeline:
======================
* click on system in "system configuration" in Manage jenkins
* search library
* Library Name: expense
* Default Version: main
* Retrieval Method: Modern SCM
* under source code management:(Git)
* =============================
* Project Repository: https://github.com/devps23/jenkins-shared-lib
* Apply and save
* to run node server through ssh , we need "SSH Build Agents" (Allows to launch agents over SSH using a java implementation of SSH protocol )

disadvantages:
==============
* there are some disadvantages in "Single branch pipeline"
1. for which branch we are running the code is not able to identify , to avoid this branch we can go for multibranch pipeline.



how to add ci-server?
=====================
* ci-server is a node agent(instance/resource)
* click on "Manage jenkins"
* click on "nodes"
* Enter "node name"
* click on "permanent agent"
* click on "create"
* Number of executors: 
* Remote root directory: /home/ec2-user
* Launch method: Launch via SSH
* Host: (ci-server host address)
* click on "credentials"
* Host Key Verification strategy: Non Verifying verification strategy
* click on "save"

------------------------------------------------------------------------------------------------------
Multibranch pipeline:
======================
* Click on Dashboard
* Enter an item name
* choose "Multi branch pipeline"
* under Branch Sources:
-----------------------
Git : Project Repository
https://github.com/devps23/expense-backend.git
Behaviour: 
* Add "Discover tags"
==========================
* click on save and apply


shared Library:
===============
* click on "Manage Jenkins"
* click on "System"
* Search "Global Pipeline Libraries"
 ====================================
* Library: expense
* Default Version: main
* Retrieval Method:
==================
* Modern SCM
* Source Code Management:
* ========================
* Git
* Project Repository: https://github.com/devps23/jenkins-shared-lib
* click on save and apply

http://jenkins-internal.pdevops72.online:8080/job/frontend/
WebHook :
=========
* click on Multibranch pipelines: click on either backend/frontend
* under "Build Configuration": 
* =============================
* click on "Scan by webhook"
* Trigger Token: expense-token
* click on ? (JENKINS_URL/multibranch-webhook-trigger/invoke?token=[Trigger token])
http://jenkins-internal.pdevops72.online:8200/multibranch-webhook-trigger/invoke?token=expense-token

CI / CD  pipeline
=================
* build an image 
* login into ecr
* push docker image into an ecr

=======================================
if master: Lint and Code Review
if developer: lint ,unit tests,integration tests,code review
if tags: npm install release