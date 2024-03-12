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
mysql_secure_installation --set-root-pass ExpenseApp@1
print_status $?