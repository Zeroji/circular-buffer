mkdir() { # create hidden folder without error
    echo -e error \\n$@ > .gitignore
    /bin/mkdir $@ > error 2>&1
    true
}
Store=data
name() { # get data address on disk
    echo "$Store/$1"
    mkdir $Store #check
}