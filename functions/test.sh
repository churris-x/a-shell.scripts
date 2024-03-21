echo 'testing script'

lg2 branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* master/(master)/' -e 's/* \(.*\)/(__\1__)/'


echo 'fin'
