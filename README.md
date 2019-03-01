# MSR-test
Created infra-provisioning,ansible-playbook,docker folders to establish the given tasks which are attached in the Devops-test document.

Each folder has contain files

1. infra provisioning folder has three files>ec2.tf, variable.tf, vpc.tf
   playbook>packages.yaml	
   docker>apache2 and couchdb

In provision folder will have a terraform stack related to vpc as well as instance creation to run this stack we have to initilize terraform init then terraform apply, it will launch the two instances with MSR-test-Instance-1,MSR-test-Instance-2 

Execution: 1. terraform init
           2. terraform apply

2. Next second task using ansible playbook, packages.yaml file has installed below mentioned packages for that i used shell modules to run this ansible-playbook as of now applied on the localhost(hostgroup is localhost) we can define our custom hostgroup also.

Execution: ansible-playbook -i inventory packages.yaml

•	NVM – Version 0.33.2
•	Node – 8.12.0
•	Docker – 18.06 or latest
•	Docker Compose – 1.13 or latest
•	Openssl – latest version
•	Git – latest version

3. Third task, to execute docker container for this required docker-compose.yaml file for executing apache webserver installation.

Execution: 1.docker-compose build
           2.docker-compose up -d

execution <ipaddress:8080>

4. Fourth task, to execute couchdb have created docker-compose.yaml

Execution: 1.docker-compose build
           2.docker-compose up -d

execution <ipaddress:5984>

5. Fifth task, commited all the code and files in github. please find below my sample github account link to go through the tasks execution

https://github.com/kranthi38/MSR-test
