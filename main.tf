data "ibm_resource_group" "rs_group" {
  name = "CDE"
}

resource "random_id" "etcd_admin_pass" {
  byte_length = 16
}

resource "ibm_database" "rhos_etcd" {
  name                         = "rhos_etcd"
  plan                         = "standard"
  location                     = "us-south"
  service                      = "databases-for-etcd"
  resource_group_id            = "${data.ibm_resource_group.rs_group.id}"
  tags                         = ["ryantiffany", "region:us-south"]
  adminpassword                = "${random_id.etcd_admin_pass.hex}"
}

resource "random_id" "es_admin_pass" {
  byte_length = 16
}

resource "ibm_database" "rhos_es" {
  name                         = "rhos_es"
  plan                         = "standard"
  location                     = "us-south"
  service                      = "databases-for-elasticsearch"
  resource_group_id            = "${var.ibm_resource_group_id}"
  tags                         = ["ryantiffany", "region:us-south"]
  adminpassword                = "${random_id.es_admin_pass.hex}"
}

output "ICD Etcd database connection string" {
  value = "${ibm_database.rhos_etcd.connectionstrings.0.composed}"
}

output "ICD Etcd database password" {
  value = "${random_id.etcd_admin_pass.hex}"
}

output "ICD Elasticsearch database connection string" {
  value = "${ibm_database.rhos_es.connectionstrings.0.composed}"
}

output "ICD Elasticsearch database password" {
  value = "${random_id.es_admin_pass.hex}"
}