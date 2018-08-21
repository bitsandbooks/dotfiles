#!/bin/bash

if [ $# -gt 0 ]; then
	ENVIRONMENT="$1"
else
	ENVIRONMENT="venv"
fi

if [[ -d $ENVIRONMENT ]]; then
	source $ENVIRONMENT/bin/activate
else
	echo "No Python virtual environment found in './$ENVIRONMENT'."
fi
