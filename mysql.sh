source common.sh

print_heading "install mysql server"
dnf install mysql-server -y &>>/tmp/expense.log
print_status $?

print_heading "enable mysqld"
systemctl enable mysqld &>>/tmp/expense.log
print_status $?

print_heading "start mysqld"
systemctl start mysqld &>>/tmp/expense.log
print_status $?

print_heading "installation of mysqld"
echo 'show databases' | mysql -h 172.31.9.13 -uroot -p${mysql_root_password} &>>/tmp/expense.log
if [ $? -ne 0 ]; then
  mysql_secure_installation --set-root-pass ${mysql_root_password} &>>/tmp/expense.log
fi
print_status $?