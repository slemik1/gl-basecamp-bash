#!/usr/bin/env bash

. ./function/addition
. ./function/subtraction
. ./function/multiplication
. ./function/division

echo "Hello, what do you need to calculate?"
echo "To get the result, enter values in this format 1 + 1 or 5 * 10"

while [[ True ]]
do
  read num1 sign num2
  if [[ $num1 == "exit" ]]; then
    echo "Goodbye"
    exit 0
  elif [[ "$num1" =~ "^[-+]?(\.[0-9]+|[0-9]+(\.[0-9]*)?)$" && "$num2" =~ "^[-+]?(\.[0-9]+|[0-9]+(\.[0-9]*)?)$" ]]; then
    echo "Invalid value"
    exit 128
  fi

  if [[ $sign =~ "/"  ]]; then
       result=$(division $num1 $num2)
  fi
  if [[ $sign =~ "+"  ]]; then
       result=$(addition $num1 $num2)
  fi
  if [[ $sign =~ "-"  ]]; then
       result=$(subtraction $num1 $num2)
  fi
  if [[ $sign =~ "*"  ]]; then
     result=$(multiplication $num1 $num2)
  fi

  echo "$result"
done
