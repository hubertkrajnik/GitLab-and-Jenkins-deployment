# Deploy GitLab and Jenkins via Terraform

Terraform infrastructure for Docker provider to deploy GitLab and Jenkins.

## Prepare your system

Create a gitlab directory to store all data:
```bash
mkdir -p /srv/gitlab
```

## Create your own Jenkins Docker image from the Dockerfile

```bash
docker build -t myjenkins .
```

## Run Terraform

To run Terraform infrastructure, use the below commands: 
```bash
terraform init
```

```bash
terraform plan
```

```bash
terraform apply
```

## After apply the plan

To log in to the root account on GitLab, you need to get the root initial password (it will be valid for 24 hours from the first time you run the container):
```bash
sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

Also, you need to get an initial password to create your first user in Jenkins:
```bash
sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

## Delete Terraform infrastructure

In case you need to destroy infrastructure, use the command:
```bash
terraform destroy
```

## Author

- [@hubertkrajnik](https://github.com/hubertkrajnik)