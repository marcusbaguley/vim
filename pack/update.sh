#!/bin/bash

for dir in ~/.vim/plack/*/start/*; do
  cd "$dir" && git pull
done
