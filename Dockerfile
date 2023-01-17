FROM ubuntu:latest AS ansible 
RUN apt update && apt upgrade -y && apt install -y wget curl python3 python3-pip python-is-python3
RUN python -m pip install --upgrade pip ansible
ENTRYPOINT ["ansible-playbook", "-i", "inventory.txt", "manage_homelab.yml"]
