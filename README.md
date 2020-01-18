
# Jenkins Setup Using Terraform on AWS EC2

This repo consist of Terraform and packer files to setup a Scalable Jenkins on AWS. Slaves are provisioned using Jenkins EC2 plugins. 

- Infrastracture is spun up using terraform
- Base AMI's are created using Packer
- Slaves are provisioned dynamically using EC2 plugins
- CLoud watch is configured to Scale up Jenkins master in case of high cpu utilization and raise alert
- Jenkins Infra is monitored using Prometheus and Grafana
- Jenkins has a job to run CI pipeline located in Repo

## Getting Started


### Creating AMI's using packer
 - 3 Kinds are Packer images are used
	 - AMI for Jenkins master: This image consist of jdk and git
	 - AMI for jenkins slave: This image consist of git, maven, ansible & other desired tools to build project
	 - AMI for Grafana and Prometheus


### Creation of Jenkins
 - The terraform to create jenkins involves 2 steps
	- Creation of VPC with 3 public and 3 private subnets in  Oregon region (US West 2)
	- Creation of Jenkins
 
### Necessary Links
[packer-templates](testfolder/testfile.txt)
 1. [packer-templates](Packer Code)
 2. VPC Terraform code
 3. Jenkins Terraform Code
 4. Jenkins Link
 5. Jenkins Credentials : username: admin, password:admin
 6. Jenkins Monitoring Tool

### Architect Diagram
![Alt text](https://github.com/arjunsreepad/aws-jenkins/raw/master/architect-diagram.jpg "architect diagram")

### Jenkins Monitoring
![Alt text](https://github.com/arjunsreepad/aws-jenkins/blob/master/grafana.png)
