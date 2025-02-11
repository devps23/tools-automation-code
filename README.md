# practice-terraform


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


CI / CD  pipeline
=================
* build an image 
* login into ecr
* push docker image into an ecr
* 