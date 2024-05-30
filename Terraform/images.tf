resource "docker_image" "gitlab" {
  name = "gitlab/gitlab-ee:latest"
  keep_locally = true
}

resource "docker_image" "jenkins" {
  name = "myjenkins:latest"
  keep_locally = true
}