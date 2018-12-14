#!/bin/sh

# Script for installing Ubuntu 18.04 for the first time downloads all the
# necessary libraries to use the system the way a nyan can

sudo apt install git i3 xutils-dev libtool xcb xcb-proto \
    libjpeg62 zsh thunar rofi feh i3blocks gtk-doc-tools \
    gobject-introspection pass htop ranger libcurl4-openssl-dev \
    libssl-dev libnlopt-dev texlive-full vim-nox compton libxml2-dev curl \
    libgdal-dev libproj-dev libglu1-mesa-dev arandr xserver-xorg-input-synaptics \
    gconf2 libappindicator1 libindicator7

# get font-awesome fonts (need to update this)
mkdir ~/.fonts
wget "https://github.com/creationix/font-awesome/blob/master/FontAwesome.ttf?raw=true" \
    -O ~/.fonts/fontawesome-webfont.ttf

# grab extra packages for zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# change the default shell to zsh
chsh -s /usr/bin/zsh

# install the dependencies for i3-gaps
sudo apt install \
    libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
    libstartup-notification0-dev libxcb-randr0-dev \
    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
    autoconf libxcb-xrm0 libxcb-xrm-dev automake

# install i3 gaps
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

# install player-ctl
cd /tmp
git clone https://github.com/acrisci/playerctl.git
cd playerctl
./autogen.sh --prefix=/usr
make
sudo make install

# install real R 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo apt update
sudo apt install r-base

# install rstudio
cd /tmp
wget https://download1.rstudio.org/rstudio-xenial-1.1.463-amd64.deb
sudo dpkg -i ./rstudio-*.deb

# install anaconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh
~/*conda*/bin/conda create -n datasci jupyter pandas numpy xarray matplotlib \
  pymc3 scipy

cd
