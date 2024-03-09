echo install nginx
dnf install nginx -y &>>/tmp/expense.log
echo $?

echo enable nginx
systemctl enable nginx &>>/tmp/expense.log
echo $?

echo start nginx
systemctl start nginx &>>/tmp/expense.log
echo $?

echo copy ecpense.conf
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo $?

echo remove
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo $?

echo download content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
echo $?

echo change directory
cd /usr/share/nginx/html &>>/tmp/expense.log
echo $?

echo unzip file
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo $?

echo restart nginx
systemctl restart nginx &>>/tmp/expense.log
echo $?