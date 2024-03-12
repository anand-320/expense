source common.sh

app_dir=/usr/share/nginx/html/

component=frontend

print_heading "install nginx"
dnf install nginx -y &>>/tmp/expense.log
print_status $?

print_heading "enable nginx"
systemctl enable nginx &>>/tmp/expense.log
print_status $?

print_heading s"tart nginx"
systemctl start nginx &>>/tmp/expense.log
print_status $?

print_heading "copy expense.conf"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
print_status $?

app-prereq


print_heading "unzip file"
unzip /tmp/frontend.zip &>>/tmp/expense.log
print_status $?

print_heading "restart nginx"
systemctl restart nginx &>>/tmp/expense.log
print_status $?