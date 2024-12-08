#!/usr/bin/env bash
#
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure  # use --prefix=/where/you/want to override installation directory, defaults to /usr/local
make
sudo make install # may require extra privileges depending on where to install
