resource "google_compute_global_forwarding_rule" "loadbalancer" {
  name        = "gowtham-mig-fwd-rule"
  port_range  = "80"
  target      = google_compute_target_http_proxy.proxy.id
}

resource "google_compute_target_http_proxy" "proxy" {
  name     = "gowtham-mig-fwd-proxy"
  url_map  = google_compute_url_map.pokenav.id
}

resource "google_compute_url_map" "pokenav" {
  name            = "gowtham-mig-map"
  default_service = google_compute_backend_service.billpc.id
}

resource "google_compute_backend_service" "billpc" {
  name          = "gowtham-mig-backend-service"
  health_checks = [google_compute_http_health_check.nursejoy.id]
  backend {
    group = google_compute_region_instance_group_manager.mig_group1.instance_group
  }
  backend {
    group = google_compute_region_instance_group_manager.mig_group2.instance_group
  }
}

resource "google_compute_http_health_check" "nursejoy" {
  name               = "gowtham-mig-chansey"
  request_path       = "/"
  check_interval_sec = 30
  timeout_sec        = 5
}
