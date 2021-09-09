variable "name" {
  type = string

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^[a-z][0-9a-z-]+[0-9a-z]$", var.name))
    error_message = "Name must begin/end with a letter and only include lower alphanums and hyphens."
  }
}
