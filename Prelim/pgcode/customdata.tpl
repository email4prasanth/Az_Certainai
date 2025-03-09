#cloud-config
package_update: true
package_upgrade: true

runcmd:
  # Install required dependencies
  - apt-get install -yqq ca-certificates curl apt-transport-https

  # Install Docker & Docker Compose
  - install -m 0755 -d /etc/apt/keyrings
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  - chmod a+r /etc/apt/keyrings/docker.asc
  - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  - apt-get update
  - apt-get install -yqq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin net-tools

  # Install Node.js (Latest LTS)
  - curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
  - apt-get install -yqq nodejs

  # Install latest stable Python
  - apt-get install -yqq python3 python3-pip

  # Install Nginx (for reverse proxy & traffic routing)
  - apt-get install -yqq nginx

  # Allow adminuser to run Docker
  - usermod -aG docker adminuser

  # Enable & start services
  - systemctl enable docker
  - systemctl start docker
  - systemctl enable nginx
  - systemctl start nginx
