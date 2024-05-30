output "gitlab_container_id" {
  value = docker_container.gitlab.id
}

output "jenkins_container_id" {
  value = docker_container.jenkins.id
}