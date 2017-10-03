#!/bin/sh

# Script for installing Ubuntu for the first time downloads all the necessary
# libraries to use the system the way a nyan can

sudo apt-get install git i3 r-base-dev xutils-dev libtool xcb xcb-proto \
    libjpeg62 zsh thunar rofi feh i3blocks gtk-doc-tools \
    gobject-introspection

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

chsh -s /usr/bin/zsh

sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
    libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev \
    libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
    autoconf

cd /tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install

cd /tmp
# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

cd /tmp
git clone https://github.com/acrisci/playerctl.git
cd playerctl
./autogen.sh --prefix=/usr
make
sudo make install

cd /tmp
# install rstudio
wget https://download1.rstudio.org/rstudio-xenial-1.0.153-amd64.deb
sudo dpkg -i ./rstudio-*.deb

# install anaconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh
~/*conda*/bin/conda create -n datasci jupyter pandas numpy xarray matplotlib \
  pymc3 scipy

cd
