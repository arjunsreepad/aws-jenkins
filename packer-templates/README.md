# AMI image baking


## Structure
Packer is the tool to bake a AMI using below desired softwares

# variables
* `aws_access_key_id`
* `aws_secret_access_key`
* `aws_region`
* `subnet_id`
* `inst_type`
* `ssh_user`



# Build Commands

* Building the Jenkins Master AMI
>  cd jenkins-master && packer build package.json
* Building the Jenkins Slave AMI
>  cd jenkins-slave && packer build package.json
* Building the Grafana and Prometheus AMI
>  cd grafana-prometheus && packer build package.json
