we are creating vpc with terraform
Region 
CIDR 
Tenancy


mvn clean package 
pom.xml 



terraform = cli command 
1.x 

cli commands:
-------------------
terraform version
terraform init --->*.tf -->downloads dependency plugin aws provider
terraform plan = *.tf = dry run 
terraform apply= creates the resources
terraform show = outputs read
terraform validate = syntax 
terraform fmt = align

arguments = inputs
attributes = outputs 


terraform import = to bring the code from manually created resources.


english = string
numbers = number 

[10.1.0.0/24,10.1.0.0/24,10.1.0.0/24]  = list 
[ap-south1a,ap-south1b]= list 

map/dictionary
{
name=apache
instancetype=m5x.large

}


depends 

terraform apply -var-file=prod.tfvars 
vpc.tf --->varaibles.tf-->dev.tfvars

what is tfvars ?
values 
variables.tf  variables declaration 


why do we use terraform ?

plan and apply ,  show ,  validate, fmt 


datasource vs resource 

main.tf, ouputs.tf resource.tf , tfvars, variables.
why do we use module 
reuse 















dataType
----------
string
number
list
map/dictinoary