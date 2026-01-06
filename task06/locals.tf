locals {
  rg_name         = format("%s", var.rg_name)
  sql_server_name = format("%s", var.sql_server_name)
  sql_db_name     = format("%s", var.sql_db_name)
  asp_name        = format("%s", var.asp_name)
  app_name        = format("%s", var.app_name)

  tags = {
    Creator = var.student_email
  }
}