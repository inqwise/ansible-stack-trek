#!/bin/bash

# Store the original PATH and VIRTUAL_ENV
original_path="$PATH"
original_virtual_env="$VIRTUAL_ENV"

# Check if VIRTUAL_ENV is set and remove it from PATH if necessary
if [ -n "$VIRTUAL_ENV" ]; then
  # Remove the VIRTUAL_ENV/bin from PATH
  export PATH=$(echo "$PATH" | sed -e "s|$VIRTUAL_ENV/bin:||" -e "s|:$VIRTUAL_ENV/bin||" -e "s|$VIRTUAL_ENV/bin||")
  echo "VIRTUAL_ENV detected and removed from PATH."
else
  echo "VIRTUAL_ENV is not set. Continuing without modifying PATH."
fi

# Run the command
./confdba --load --file=../etc/config.json

# Restore original PATH and VIRTUAL_ENV if they were modified
if [ -n "$original_virtual_env" ]; then
  export PATH="$original_path"
  export VIRTUAL_ENV="$original_virtual_env"
  echo "PATH and VIRTUAL_ENV restored to original values."
fi
