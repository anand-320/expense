print_heading() {
  echo $1
  echo "********** $1 **********" &>>/tmp/expense.log
}

print_status() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32msuccess\e [0m"
  else
    echo -e "\e[31mfailure\e [0m"
  fi
}