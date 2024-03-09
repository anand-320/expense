echo install nginx
dnf install nginx -y &>>/tmp/expense.log
echo enable nginx
systemctl enable nginx &>>/tmp/expense.log
echo start nginx
systemctl start nginx &>>/tmp/expense.log
echo copy ecpense.conf
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo remove
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo download content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
echo change directory
cd /usr/share/nginx/html &>>/tmp/expense.log
echo unzip file
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo restart nginx
systemctl restart nginx &>>/tmp/expense.log
