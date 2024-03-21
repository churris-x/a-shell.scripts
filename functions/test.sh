echo 'testing script'

# impossible to parse the current git branch name because libgit is old and garbage :D
# parse_git_branch () {
#     lg2 branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* master/(master)/' -e 's/* \(.*\)/(__\1__)/'
# }

comeonfortheloveofgod () {
    ping 8.8.8.8
}

comeonfortheloveofgod

echo ''
echo 'spacing'
echo ''


shouldnotbethisdifficult () {
    ping 8.8.8.8 | while read -r pong; do echo "$(date): $pong"; done
}

shouldnotbethisdifficult

echo 'fin'
