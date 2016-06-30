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
