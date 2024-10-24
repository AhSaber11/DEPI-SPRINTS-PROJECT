#!/bin/bash

cd ../terraform 
echo "applying terraform"
ip=$(terraform apply -auto-approve | grep "web_instance_ip" | grep -Eo '[0-9]{1,4}.[0-9]{1,4}.[0-9]{1,4}.[0-9]{1,4}')

echo "changing ip to ec2 ip in the inventory and jenkins variables"
sed -i 's/ansible_host.*/ansible_host: '$ip'/' ../Ansible/Jenkins+Docker/inventory/hosts.yml
sed -i 's/^jenkins_ip:.*/jenkins_ip: '$ip'/' ../Ansible/Jenkins+Docker/roles/jenkins/defaults/main.yml

echo "Ansible is starting now, wait"
cd ../Ansible/Jenkins+Docker
ansible-playbook  RunMe.yml 

#echo "$ip"
