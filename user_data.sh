#!/bin/sh
sudo yum update -y
sudo useradd eco
sudo echo "welcome2aris" | passwd --stdin eco
sudo echo " eco ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo mkdir -p /home/eco/.ssh/
sudo chown eco:eco /home/eco/.ssh/
sudo chmod 700 /home/eco/.ssh/
sudo cp /home/ec2-user/.ssh/authorized_keys /home/eco/.ssh/
sudo chown eco:eco /home/eco/.ssh/authorized_keys
sudo chmod 600 /home/eco/.ssh/authorized_keys
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd restart
