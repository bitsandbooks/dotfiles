#!/bin/bash

# Get computer name
box_name() { [ -f $HOME/.box-name ] && cat $HOME/.box-name || hostname -s }

# Create a new directory and enter it
md() { mkdir -p "$@" && cd "$@" }

# Gzip-enabled `curl`
function gurl() { curl -sH "Accept-Encoding: gzip" "$@" | gunzip }

