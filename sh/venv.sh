#!/bin/bash

if [ $# -gt 0 ]; then
	ENVIRONMENT="$1"
else
	ENVIRONMENT="venv"
fi

if [[ -f $ENVIRONMENT/bin/activate ]]; then
	source $ENVIRONMENT/bin/activate
else
	echo "Python virtual environment activator not found in ./$ENVIRONMENT/bin/activate."
fi
