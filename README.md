# aws_two_tier_app_using_terraform


## Required


Create two tier app in AWS using Terraform tool

* create 2 instances [web instance , Mysql_RDS instance] in different AZs

* The web instance in a public-subnet and internet-gateway 

* The mysql-RDS instance in 2 private subnets

* each ec2 has its own  security-group

* using `modules and variables` in tf code
--------------------------------------------------------------------------
## the modules that has been used in : https://github.com/nourhanabdallah/two_tier_app_modules.git



------------------------------------------------------------------------
## Backend 

 useing  S3 Bucket to store the tfstate file
 
 ![image](https://user-images.githubusercontent.com/125203973/222966958-9d8bc05c-bb4b-4161-9348-9ab7dbb1958a.png)
----------------------------------------------------------------------------------

##  Created Resouces

### Subnets

* Public Subnet  ` cidr = "192.168.101.0/28" `.

![image](https://user-images.githubusercontent.com/125203973/222969235-f36649ac-b365-406b-a52e-417bbd918f1c.png)


* Two (2) Private Subnets  `cidr = "192.168.101.32/28"`   `cidr = "192.168.101.64/28"`.

![image](https://user-images.githubusercontent.com/125203973/222969286-7f58beae-22b8-4d98-bf3a-d0daab07fc69.png)


![image](https://user-images.githubusercontent.com/125203973/222969331-d95106fc-890c-4a0b-ba81-972edf6f3225.png)


### Internet Gateway

This internet gateway is associated with the public subnet.

![image](https://user-images.githubusercontent.com/125203973/222968784-157f8644-92e8-475a-99b9-0aaeba1bf487.png)


![image](https://user-images.githubusercontent.com/125203973/222969400-f6b65d7b-6b9f-4c93-b790-eae8113c11fc.png)

### EC2 Instances
 * web :This instance acts as a web server.
It is created using one of Amazin Machines Images (AMIs).
Ensure that the image is available in the region since AMIs are a regional resource
Security Groups

Security Group for web-instance. Ports [80 and 443] are open.
* RDS : database instance
Security Group for rds-instance. Port [3306] is open inside the VPC.

![image](https://user-images.githubusercontent.com/125203973/222969634-a0422545-5e70-45c3-bdd9-db7071e77960.png)


   ## note: 
`skip_final_snapshot  = false` : don't miss to set identifier for  final snapshots

or 
`skip_final_snapshot  = true `

----------------------------------------------------------------------------------------------------------------

## Usage
Initialize The Terraform with Modules.
$ `terraform init`

Dry-Run.
$ `terraform plan`


Apply the changes and start provision infrastructure
$ `terraform apply`


Delete infrastructure
$ `terraform destroy`



