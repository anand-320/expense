print_heading() {
  echo $1
  echo "********** $1 **********" &>>/tmp/expense.log
}
print_heading "install nginx"
dnf install nginx -y &>>/tmp/expense.log
echo $?

print_heading "enable nginx"
systemctl enable nginx &>>/tmp/expense.log
echo $?

print_heading s"tart nginx"
systemctl start nginx &>>/tmp/expense.log
echo $?

print_heading "copy ecpense.conf"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo $?

print_heading "remove files"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo $?

print_heading "download content"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
echo $?

print_heading "change directory"
cd /usr/share/nginx/html &>>/tmp/expense.log
echo $?

print_heading "unzip file"
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo $?

print_heading "restart nginx"
systemctl restart nginx &>>/tmp/expense.log
echo $?