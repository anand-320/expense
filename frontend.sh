dnf install nginx -y >/tep/expense.log
systemctl enable nginx >/tep/expense.log
systemctl start nginx >/tep/expense.log
cp expense.conf /etc/nginx/default.d/expense.conf >/tep/expense.log
rm -rf /usr/share/nginx/html/* >/tep/expense.log
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >/tep/expense.log
cd /usr/share/nginx/html >/tep/expense.log
unzip /tmp/frontend.zip >/tep/expense.log
systemctl restart nginx >/tep/expense.log
