#!/bin/bash
let rc=0
if [ -e ~/.vimrc ]; then
    echo "error: ~/.vimrc already exists"
    rc=1
fi
if [ -e ~/.vim ]; then
    echo "error: ~/.vim already exists"
    rc=1
fi
if [ $rc == 0 ]; then
    ln -sr ./vimrc ~/.vimrc && ln -sr ./vim ~/.vim
    if [ $? != 0 ]; then
        echo "error: creating symbolic links failed"
    else
        echo "symbolic links to srVimConfiguration successfully created"
    fi
fi
exit $rc

