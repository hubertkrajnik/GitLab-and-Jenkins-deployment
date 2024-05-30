resource "docker_volume" "gitlab_config" {
  name = "gitlab_config"
  driver_opts = {
    o      = "bind"
    device = "${var.gitlab_home}/config"
    type   = "volume"
  }
}

resource "docker_volume" "gitlab_logs" {
  name = "gitlab_logs"
  driver_opts = {
    o      = "bind"
    device = "${var.gitlab_home}/logs"
    type   = "volume"
  }
}

resource "docker_volume" "gitlab_data" {
  name = "gitlab_data"
  driver_opts = {
    o      = "bind"
    device = "${var.gitlab_home}/data"
    type   = "volume"
  }
}

resource "docker_volume" "jenkins_data" {
  name = "jenkins-data"
}

resource "docker_volume" "jenkins_docker_certs" {
  name = "jenkins_docker_certs"
}