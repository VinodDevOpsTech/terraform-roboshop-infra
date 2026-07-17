component = $1
environment = $2
sudo dnf install ansible -y
mkdir /var/log/roboshop
chown -R ec2-user:ec2user /var/log/roboshop
chmod -R 755 /var/log/roboshop
touch var/log/roboshop/ansible.log

cd home/ec2-user
git clone https://github.com/VinodDevOpsTech/ansible-roboshop-v3.git
cd ansible-roboshop-v3
git pull

ansible-playbook -e component=$component -e env=$envronment roboshop.yaml