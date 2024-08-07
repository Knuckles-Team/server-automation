FROM ubuntu:latest AS ansible
RUN apt update && apt upgrade -y && apt install -y wget curl python3 python3-pip python-is-python3 sshpass tmux \
    && rm -rf /usr/lib/python3*/EXTERNALLY-MANAGED \
    && rm -rf /var/lib/python3*/EXTERNALLY-MANAGED \
    && python -m pip install --upgrade pip \
    && python -m pip install --upgrade ansible
COPY . /
ENTRYPOINT ["ansible-playbook", "-i", "inventory.yml", "manage_homelab.yml", "-e", "directory=/home/ansible/Development"]
