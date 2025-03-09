resource "azurerm_public_ip" "lb_pip" {
  name                = "${var.lb_name}-pip"
  location            = var.Loca_name
  resource_group_name = var.RG_name
  allocation_method   = "Static"
  sku                = "Standard"
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.Loca_name
  resource_group_name = var.RG_name
  sku                = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }

  tags = var.Tags
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackendPool"
}

resource "azurerm_lb_probe" "http_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "http-probe"
  protocol        = "Http"
  port            = 80
  request_path    = "/"
}

resource "azurerm_lb_rule" "http_rule" {
  loadbalancer_id               = azurerm_lb.lb.id
  name                           = "HTTP"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.lb_backend_pool.id]
  probe_id                       = azurerm_lb_probe.http_probe.id
}

# # Optional NAT Rule for SSH Access
# resource "azurerm_lb_nat_rule" "ssh_rule" {
#   count                          = var.enable_nat_rule ? 1 : 0
#   name                           = "SSH"
#   resource_group_name            = var.RG_name   # ✅ Add the missing attribute
#   loadbalancer_id                = azurerm_lb.lb.id
#   protocol                       = "Tcp"
#   frontend_port                  = 22
#   backend_port                   = 22
#   frontend_ip_configuration_name = "PublicIPAddress"
# }

