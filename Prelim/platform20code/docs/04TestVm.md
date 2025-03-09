- I used already exsiting key which was generated for **email4prasanth@gmail.com**, that contains
```sh
id_rsa
id_rsa.pub
known_hosts
known_hosts.old
```
- Use the public IP and the private SSH key to connect to the VM
```sh
ssh -i ~/.ssh/id_rsa adminuser@52.191.137.61
ls -al
uname -a
df -h
exit
```
- SSH Key: Ensure you have an SSH key pair. If you don't have one, generate it:
```sh
ssh-keygen -t rsa -b 4096 -C "reachtechprasanth@gmail.com"
```
### Hybrid Approacht to application environment
- To set up the application environment on the VM.
    - Best for Integration - .tpl file for initial setup (e.g., installing packages, enabling services).
    - Best for Reusability - .sh script for post-provisioning tasks scripts are more reusable across different environments (e.g., deploying applications, configuring settings).
### Check Installed Packages:
```sh
bash app-setup.sh
```
