#!/usr/bin/env bash

script_dir=`dirname "$0"`

pushd . > /dev/null
cd $script_dir

if ! command -v mkdocs &> /dev/null; then
  # If mkdocs is missing, install the requirements
  pip install -r requirements.txt
fi

mkdocs serve -a localhost:8089

popd > /dev/null
