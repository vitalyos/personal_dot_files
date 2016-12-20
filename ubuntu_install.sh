#!/bin/bash

echo "update"
sudo apt-get update
sudo apt-get dist-upgrade --yes

add_repo() {
  echo "Add repo: $1";
  sudo add-apt-repository --yes $1;
}

echo "install software-properties-common"
sudo apt-get install software-properties-common

echo "add repos"
add_repo "ppa:mc3man/mpv-tests"
add_repo "ppa:ubuntu-toolchain-r/test"
add_repo "ppa:snwh/pulp"
add_repo "ppa:webupd8team/atom"
add_repo "ppa:neovim-ppa/unstable"

sudo apt-get update
sudo apt-get dist-upgrade --yes

echo "install packages"
sudo apt-get install --yes aptitude gdebi geany vim  git cmake valgrind valkyrie cppcheck cppcheck-gui gcc g++ vlc doublecmd-qt clipit mpv build-essential paper-gtk-theme paper-icon-theme atom fonts-hack-ttf gnome-tweak-tool clang gdb caffeine guake openjdk-8-jre openjdk-8-jre meld dconf-editor caffeine tree rsync software-properties-common neovim maven solaar solaar-gnome3

echo "remove unnecessary packages"
sudo apt-get remove --purge --yes thunderbird

echo "git configuration"
git config --global user.name vitalyos
git config --global user.email vitalyos@users.noreply.github.com
git config --global core.editor nvim
git config --global diff.tool meld

echo "install atom packages"
apm install atom-arma-language file-icons linter-swiftc atom-beautify hex material-design-syntax atom-material-syntax language-cmake material-ui atom-material-syntax-dark language-cpp14 native-ui atom-material-syntax-light language-dot-template pdf-view atom-material-ui language-haskell php-composer-completion atom-terminus language-ini autocomplete language-latex autocomplete-cmake language-qml swift-debugger language-swift tag autocomplete-plus latex terminal-plus autocomplete-swift latex-completions todo-show autocomplete-xml line-count xcode-syntax build-tools linter xml-formatter build-xcodebuild linter-cppcheck xml-tools cpp-refactor linter-cpplint set-syntax atom-runner python-tools

echo "create my folder structure"
cd ~
mkdir repos
mkdir zakota
mkdir builds
mkdir --parents tools/scripts

echo "customize my unity dash..."
gsettings set com.canonical.Unity.Launcher launcher-position Bottom
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

echo "set up aliases"
cp .bash_aliases ~

skp_bin=skpe.deb
echo "install skype for linux alpha"
wget -O $skp_bin https://go.skype.com/skypeforlinux-64-alpha.deb
sudo gdebi $skp_bin
rm $skp_bin
