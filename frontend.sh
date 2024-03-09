source common.sh

print_heading "install nginx"
dnf install nginx -y &>>/tmp/expense.log
print_status $?

print_heading "enable nginx"
systemctl enable nginx &>>/tmp/expense.log
print_status $?

print_heading s"tart nginx"
systemctl start nginx &>>/tmp/expense.log
print_status $?

print_heading "copy ecpense.conf"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
print_status $?

print_heading "remove files"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
print_status $?

print_heading "download content"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
print_status $?

print_heading "change directory"
cd /usr/share/nginx/html &>>/tmp/expense.log
print_status $?

print_heading "unzip file"
unzip /tmp/frontend.zip &>>/tmp/expense.log
print_status $?

print_heading "restart nginx"
systemctl restart nginx &>>/tmp/expense.log
print_status $?