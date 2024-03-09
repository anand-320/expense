print_heading() {
  echo $1
  echo "********** $1 **********" &>>/tmp/expense.log
}

print_status() {
  if [ $1 -eq 0]; then
    echo success
  else
    echo failure
  fi
}