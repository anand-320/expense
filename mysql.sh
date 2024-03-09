source common.sh

print_heading "install mysql server"
dnf install mysql-server -y
echo $?

print_heading "enable mysqld"
systemctl enable mysqld
echo $?

print_heading "start mysqld"
systemctl start mysqld
echo $?

print_heading "installation of mysqld"
mysql_secure_installation --set-root-pass ExpenseApp@1
