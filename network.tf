resource "google_compute_network" "pokenav" {
    name = "gowtham-tf-vpc"
    description = "vpc-name"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "kanto" {
    name = "gowtham-sub1"
    region = "gowham-west1"
    ip_cidr_range   = "10.0.1.0/24"
    network = google_compute_network.pokenav.self_link
    private_ip_google_access = true
    }


resource "google_compute_subnetwork" "hoenn" {
    name = "gowtham-sub2"
    region = "us-east1"
    ip_cidr_range   = "10.0.2.0/24"
    network = google_compute_network.pokenav.self_link
    private_ip_google_access = true
    }
