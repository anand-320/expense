source common.sh

app_dir=/app

component=backend


print_heading "disable nodejs -y"
dnf module disable nodejs -y &>>/tmp/expense.log
print_status $?

print_heading "enable nodejs:20"
dnf module enable nodejs:20 -y &>>/tmp/expense.log
print_status $?

print_heading "install nodejs"
dnf install nodejs -y &>>/tmp/expense.log
print_status $?

print_heading "add user expense"
id expense &>>/tmp/expense.log
if [ $? -ne 0 ]; then
  useradd expense &>>/tmp/expense.log
fi

print_status $?

print_heading "copy backend esrvice file"
cp backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log
print_status $?

app-prereq

print_heading "unzip the content"
unzip /tmp/backend.zip &>>/tmp/expense.log
print_status $?

print_heading "install npm"
npm install &>>/tmp/expense.log
print_status $?

print_heading "daemon-reload"
systemctl daemon-reload &>>/tmp/expense.log
print_status $?

print_heading "enable backend"
systemctl enable backend &>>/tmp/expense.log
print_status $?

print_heading "start backend"
systemctl start backend &>>/tmp/expense.log
print_status $?

print_heading "install mysql"
dnf install mysql -y &>>/tmp/expense.log
print_status $?

print_heading "give password"
mysql -h mysql-dev.janand.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>/tmp/expense.log
print_status $?

