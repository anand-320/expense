source common.sh

mysql_root_password=$1
if [ -z "($mysql_root_password)" ]; then
  echo password is missing
  exit 1
fi

print_heading "disable nodejs -y"
dnf module disable nodejs -y &>>/tmp/expense.log
echo $?

print_heading "enable nodejs:20"
dnf module enable nodejs:20 -y &>>/tmp/expense.log
echo $?

print_heading "install nodejs"
dnf install nodejs -y &>>/tmp/expense.log
echo $?

print_heading "add user expense"
useradd expense &>>/tmp/expense.log
echo $?

print_heading "copy backend esrvice file"
cp backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log
echo $?

print_heading "clear /appx"
rm -rf /app &>>/tmp/expense.log
echo $?

print_heading "creating /app"
mkdir /app &>>/tmp/expense.log
echo $?

print_heading "downloading content"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>>/tmp/expense.log
echo $?

print_heading "moving to /app directory"
cd /app &>>/tmp/expense.log
echo $?

print_heading "unzip the content"
unzip /tmp/backend.zip &>>/tmp/expense.log
echo $?

print_heading "moving to /app directory"
cd /app &>>/tmp/expense.log
echo $?

print_heading "install npm"
npm install &>>/tmp/expense.log
echo $?

print_heading "daemon-reload"
systemctl daemon-reload &>>/tmp/expense.log
echo $?

print_heading "enable backend"
systemctl enable backend &>>/tmp/expense.log
echo $?

print_heading "start backend"
systemctl start backend &>>/tmp/expense.log
echo $?

print_heading "install mysql"
dnf install mysql -y &>>/tmp/expense.log
echo $?

print_heading "give password"
mysql -h 172.31.9.13 -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>/tmp/expense.log
echo $?
