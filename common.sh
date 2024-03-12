print_heading() {
  echo $1
  echo "********** $1 **********" &>>/tmp/expense.log
}

print_status() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32msuccess\e[0m"
  else
    echo -e "\e[31mfailure\e[0m"
  fi
}
app-prereq() {
print_heading "clear /appx"
rm -rf ${app_dir} &>>/tmp/expense.log
print_status $?

print_heading "creating /app"
mkdir ${app_dir} &>>/tmp/expense.log
print_status $?

print_heading "downloading content"
curl -o /tmp/${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip &>>/tmp/expense.log
print_status $?

print_heading "moving to /app directory"
cd ${app_dir} &>>/tmp/expense.log
print_status $?

}