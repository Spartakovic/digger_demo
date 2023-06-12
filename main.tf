variable "test_var" {
  type=string
}

resource "null_resource" "test2" {
  provisioner  "local-exec" {
    command = "echo ${var.test_var}"
  }
}

