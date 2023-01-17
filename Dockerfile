FROM ubuntu:latest AS ansible 
RUN apt update && apt upgrade -y && apt install -y wget curl python3 python3-pip python-is-python3
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade ansible
COPY . /
ENTRYPOINT ["ansible-playbook", "-vvvv", "-i", "inventory.txt", "manage_homelab.yml"]
