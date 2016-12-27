#!/bin/bash

echo "Install powerline shell"

PLINE_FOLDER=viti-pline
DEST_FOLDER=~/tools/scripts
BASHRC=~/.bashrc
P_SHELL_FILE=powerline-shell.py
git clone https://github.com/milkbikis/powerline-shell $PLINE_FOLDER

cd $PLINE_FOLDER
cp config.py.dist config.py
python install.py
mkdir --parents $DEST_FOLDER
mv $P_SHELL_FILE $DEST_FOLDER/
cd ..
rm -rf $PLINE_FOLDER

echo "" >> $BASHRC
echo "function _update_ps1() { PS1=\"\$($DEST_FOLDER/powerline-shell.py \$? 2> /dev/null)\";}" >> $BASHRC
echo "if [ \"\$TERM\" != \"linux\" ]; then PROMPT_COMMAND=\"_update_ps1; \$PROMPT_COMMAND\"; fi" >> $BASHRC
