#!/bin/bash

cd `dirname $0`

ln -sf `pwd`/emacs ~/.emacs
ln -sf `pwd`/start-emacs.sh ~/start-emacs.sh

echo "export TERM=xterm-256color" >> ~/.bashrc
