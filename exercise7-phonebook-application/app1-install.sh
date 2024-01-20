#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
TOKEN="XXXXXXXXXXXXXXXX"
FOLDER="https://$TOKEN@raw.githubusercontent.com/AydinTokuslu/private-my-projects/main/Project-004-Phonebook-Application"
curl -s --create-dirs -o "/home/ec2-user/templates/index.html" -L "$FOLDER"/templates/index.html
curl -s --create-dirs -o "/home/ec2-user/templates/add-update.html" -L "$FOLDER"/templates/add-update.html
curl -s --create-dirs -o "/home/ec2-user/templates/delete.html" -L "$FOLDER"/templates/delete.html
curl -s --create-dirs -o "/home/ec2-user/phonebook-app.py" -L "$FOLDER"/phonebook-app.py
python3 /home/ec2-user/phonebook-app.py




#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
yum install git -y
cd /home/ec2-user
FOLDER="https://raw.githubusercontent.com/AydinTokuslu/my-aws-projects/main/aws/Project-001-Roman-Numerals-Converter"
wget ${FOLDER}/app.py
mkdir templates && cd templates
wget ${FOLDER}/templates/index.html
wget ${FOLDER}/templates/result.html
cd ..
python3 app.py