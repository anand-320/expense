source common.sh

mysql_root_password=$1

print_heading "disable nodejs -y"
dnf module disable nodejs -y
echo $?

print_heading "enable nodejs:20"
dnf module enable nodejs:20 -y
echo $?

print_heading "install nodejs"
dnf install nodejs -y
echo $?

print_heading "add user expense"
useradd expense
echo $?

print_heading "copy backend esrvice file"
cp backend.service /etc/systemd/system/backend.service
echo $?

print_heading "clear /appx"
rm -rf /app
echo $?

print_heading "creating /app"
mkdir /app
echo $?

print_heading "downloading content"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
echo $?

print_heading "moving to /app directory"
cd /app
echo $?

print_heading "unzip the content"
unzip /tmp/backend.zip
echo $?

print_heading "moving to /app directory"
cd /app
echo $?

print_heading "install npm"
npm install
echo $?

print_heading "daemon-reload"
systemctl daemon-reload
echo $?

print_heading "enable backend"
systemctl enable backend
echo $?

print_heading "start backend"
systemctl start backend
echo $?

print_heading "install mysql"
dnf install mysql -y
echo $?

print_heading "give password"
mysql -h 172.31.9.13 -uroot -p{mysql_root_password} < /app/schema/backend.sql
echo $?
