source common.sh

mysql_root_password=$1
if [ -z "${mysql_root_password}"]; then
  echo input is missing
  exit 1
fi

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
echo 'show databases' | mysql -h 172.31.13.176 -uroot -p{mysql_root_password} &>>/tmp/expense.log
if [ $? ne 0 ]; then
  mysql_secure_installation --set-root-pass {mysql_root_password} &>>/tmp/expense.log
fi
print_status $?