#!/bin/sh
# Checks Internet connection
myping () {
    ping 8.8.8.8 | while read pong; do echo "$(date): $pong"; done
}
