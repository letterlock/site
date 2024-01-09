#!/bin/bash

compiled_files=(
  "index.html"
  "about.html"
  "not_found.html"
  "writing.html"
  "code.html"
  "links.html"
  "archive.html"
  "legal.html"
)

for file in ${compiled_files[@]}; do
  touch compiled/$file
  cat meta/headerOne.html > compiled/$file

  # add spaces to make things look pretty
  echo -n "     " >> compiled/$file

  # iterate over characters in the current file name
  # set i (iterator value) to 0, if i < # chars in name:
  # increment i, echo one character in the file name with
  # the index of i to the compiled file without newlines (-n)
  for ((i = 0; i < ${#file}; i++)); do
    echo -n " ${file:i:1}" >> compiled/$file
  done

  # add a space at the end so we get a newline to
  #  make things look pretty
  echo " " >> compiled/$file

  cat meta/headerTwo.html >> compiled/$file

  # this will probably have to be fixed later if
  # there are more cases that don't need the navbar
  if [ $file != "links.html" ]; then 
    cat meta/navbar.html >> compiled/$file
  fi

  cat pages/$file >> compiled/$file
  cat meta/footer.html >> compiled/$file
done
