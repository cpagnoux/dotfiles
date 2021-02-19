#!/bin/bash

for file in {.[^.],}*; do
  if [[ "$file" == "$0" || "$file" == .git ]]; then
    continue
  fi

  cp -rv "$file" ~/
done
