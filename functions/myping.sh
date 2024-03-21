#!/bin/sh
# Checks Internet connection

# This is currently not working for some reason ¯\_(ツ)_/¯
myping () {
    ping 8.8.8.8 | while read -r pong; do echo "$(date): $pong"; done
}

myping
