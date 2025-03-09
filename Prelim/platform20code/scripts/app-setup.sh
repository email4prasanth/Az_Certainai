#!/bin/bash

# Check PATH
echo "=== Checking PATH ==="
echo $PATH

# Check installed packages
echo "=== Checking installed packages ==="
dpkg -l | grep -E "wget|curl|net-tools|jq|unzip"

# Check Docker installation
echo -e "\n=== Checking Docker ==="
which docker || echo "Docker not found in PATH"
docker --version || echo "Docker not installed"
docker-compose --version || echo "Docker Compose not installed"

# Check Docker images and containers
echo -e "\n=== Checking Docker images and containers ==="
docker images || echo "Docker not installed or not running"
docker ps || echo "Docker not installed or not running"

# Check Node.js installation
echo -e "\n=== Checking Node.js ==="
which node || echo "Node.js not found in PATH"
node --version || echo "Node.js not installed"

# Check Python installation
echo -e "\n=== Checking Python ==="
python3 --version || echo "Python not installed"

# Check Nginx installation
echo -e "\n=== Checking Nginx ==="
which nginx || echo "Nginx not found in PATH"
nginx -v || echo "Nginx not installed"

# Check Java installation
echo -e "\n=== Checking Java ==="
which java || echo "Java not found in PATH"
java -version || echo "Java not installed"
which javac || echo "Java compiler not found in PATH"
javac -version || echo "Java compiler not installed"