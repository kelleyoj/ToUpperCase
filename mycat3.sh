#!/bin/bash
arg1=$1

if [ "$#" -gt 0 ] || [ "$arg1" == "-u" ] || [ "$arg1" == "-l" ] || [ "$arg1" == "-t" ];then #checking is no args are entered
  if [ ${arg1} == "-u" ];then ##checking if arg 1 is '-u'. if it is then it shift pass arg 1 grabs whats in the file and convert it into uppercase then echo's it
    shift
    for arg in "$@"
    do
    echo | tr '[:lower:]' '[:upper:]' < "$arg" # convert the file content to upper case
    done
  elif [ ${arg1} == "-l" ];then #checking if arg 1 is '-l'. if it is then it shift pass arg 1 grabs whats in the file and convert it into lower cast then echo's it
    shift
    for arg in "$@"
    do
    echo | tr '[:upper:]' '[:lower:]' < "$arg" # convert the file content to upper case
    done
  elif [ ${arg1} == "-t" ];then
    shift
    for arg
    do
    echo | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1' < $arg  # convert the first letter on each word to upper case
    done
    #printing the error messages
  else
        >&2 echo "Usage: mycat3 [-u|-l|-t] FILE ...Description: Uses -u,-l,-t to change what is entered ."
  fi
else
      >&2 echo "Usage: mycat3.sh [-u|-l|-t] FILE ...Description: Uses -u,-l,-t to change what is entered ."
fi
