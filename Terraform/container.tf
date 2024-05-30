resource "docker_container" "gitlab" {
  image = docker_image.gitlab.name
  name  = "gitlab"
  hostname = "gitlab.devops.com"
  restart = "always"
  shm_size = 256
  env = [
    "GITLAB_OMNIBUS_CONFIG=external_url 'http://gitlab.devops.com:8929'; gitlab_rails['gitlab_shell_ssh_port'] = 2424"
  ]
  network_mode = docker_network.devops.name
  ports {
    internal = 8929
    external = 8929
  }
  ports {
    internal = 2424
    external = 2424
  }
  volumes {
    volume_name    = docker_volume.gitlab_config.name
    container_path = "/etc/gitlab"
  }
  volumes {
    volume_name    = docker_volume.gitlab_logs.name
    container_path = "/var/log/gitlab"
  }
  volumes {
    volume_name    = docker_volume.gitlab_data.name
    container_path = "/var/opt/gitlab"
  }
}

resource "docker_container" "jenkins" {
  image = docker_image.jenkins.name
  name  = "jenkins"
  hostname = "jenkins.devops.com"
  restart = "on-failure"
  env = [
    "DOCKER_HOST=tcp://docker:2376",
    "DOCKER_CERT_PATH=/certs/client",
    "DOCKER_TLS_VERIFY=1"
  ]
  network_mode = docker_network.devops.name
  ports {
    internal = 8080
    external = 8080
  }
  ports {
    internal = 50000
    external = 50000
  }
  volumes {
    volume_name    = docker_volume.jenkins_data.name
    container_path = "/var/jenkins_home"
  }
  volumes {
    volume_name    = docker_volume.jenkins_docker_certs.name
    container_path = "/certs/client"
    read_only      = true
  }
}