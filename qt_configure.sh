#!/bin/bash

echo "configure Qt framework"

QT_VERSION="5.7"
QT_INSTALL_DIR=/opt
BASHRC_FILE=/etc/bash.bashrc
LD_CONF_FILE=/etc/ld.so.conf.d/qt5.conf
sudo bash -c "echo 'PATH=$QT_INSTALL_DIR/Qt/$QT_VERSION/gcc_64/bin/:$QT_INSTALL_DIR/Qt/Tools/QtCreator/bin/:\$PATH; export PATH;' >> $BASHRC_FILE"
bash -c ". $BASHRC_FILE"
sudo touch $LD_CONF_FILE
sudo bash -c "echo \"$QT_INSTALL_DIR/Qt/$QT_VERSION/gcc_64/lib\" >> $LD_CONF_FILE"
sudo ldconfig
qmake -query

echo "add Darcula theme form github.com/mervick/Qt-Creator-Darcula"
wget https://github.com/mervick/Qt-Creator-Darcula/archive/master.zip

ZIP_FILE=master.zip
STYLES_FOLDER=~/.config/QtProject/qtcreator/styles
PROJ_FOLDER=Qt-Creator-Darcula-master
PROJ_RES_FOLDER=~/.config/QtProject/qtcreator/darcula

unzip $ZIP_FILE

mkdir $STYLES_FOLDER
mkdir $PROJ_RES_FOLDER

cp $PROJ_FOLDER/darcula.xml $STYLES_FOLDER
cp $PROJ_FOLDER/darcula.css $PROJ_RES_FOLDER
cp --recursive $PROJ_FOLDER/images $PROJ_RES_FOLDER

rm -rf $PROJ_FOLDER
rm $ZIP_FILE
