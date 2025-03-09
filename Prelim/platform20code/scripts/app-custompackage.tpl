#cloud-config
package_update: true
package_upgrade: true

runcmd:
  # Install required dependencies
  - apt-get install -yqq ca-certificates # Ensures SSL/TLS certificates are up-to-date for secure connections
  - apt-get install -yqq wget # Command-line utility for downloading files from the web
  - apt-get install -yqq curl # Tool for transferring data with URLs (used for API interactions, downloads, etc.)
  - apt-get install -yqq net-tools # Provides networking utilities like ifconfig, netstat, etc.
  - apt-get install -yqq jq # Lightweight command-line JSON processor for parsing and manipulating JSON data
  - apt-get install -yqq unzip # Utility for extracting compressed ZIP files

  # Install additional development and system tools
  - apt-get install -yqq git # Distributed version control system for source code management
  - apt-get install -yqq vim # Highly configurable text editor for efficient coding and file editing
  - apt-get install -yqq apt-transport-https # Allows the package manager to transfer files over HTTPS
  - apt-get install -yqq software-properties-common # Provides utilities for managing software repositories (e.g., add-apt-repository)

  # Install Docker (official repository)
  - install -m 0755 -d /etc/apt/keyrings
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  - chmod a+r /etc/apt/keyrings/docker.asc
  - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  - apt-get update
  - apt-get install -yqq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Install Node.js (Latest LTS)
  - curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
  - apt-get install -yqq nodejs

  # Install Python (latest stable)
  - apt-get install -yqq python3 python3-pip

  # Install Nginx (for reverse proxy & traffic routing)
  - apt-get install -yqq nginx

  # Install Java 21 (JDK 21)
  - apt-get install -yqq libc6-x32 libc6-i386 # Required for 32-bit compatibility (optional)
  - mkdir -p /usr/lib/jvm # Create directory for Java installations
  - wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/openjdk-21_linux-x64_bin.tar.gz -O /tmp/openjdk-21.tar.gz # Download Java 21
  - tar -xzf /tmp/openjdk-21.tar.gz -C /usr/lib/jvm # Extract Java 21
  - update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-21/bin/java 2100 # Set Java 21 as default
  - update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-21/bin/javac 2100 # Set javac (Java compiler)
  - update-alternatives --set java /usr/lib/jvm/jdk-21/bin/java # Ensure Java 21 is selected
  - update-alternatives --set javac /usr/lib/jvm/jdk-21/bin/javac # Ensure javac is selected
  - rm /tmp/openjdk-21.tar.gz # Clean up downloaded archive
  # Allow adminuser to run Docker
  - usermod -aG docker adminuser

  # Enable & start services
  - systemctl enable docker
  - systemctl start docker
  - systemctl enable nginx
  - systemctl start nginx