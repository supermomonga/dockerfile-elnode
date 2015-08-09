FROM debian:jessie
MAINTAINER supermomonga

RUN apt-get update \
    && apt-get install -y\
    autoconf\
    automake\
    libtool\
    texinfo\
    build-essential\
    xorg-dev\
    libgtk2.0-dev\
    libjpeg-dev\
    libncurses5-dev\
    libdbus-1-dev\
    libgif-dev\
    libtiff-dev\
    libm17n-dev\
    libpng12-dev\
    librsvg2-dev\
    libotf-dev\
    libxml2-dev\
    \
    git\
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 git://git.sv.gnu.org/emacs.git\
    && cd emacs\
    && ./autogen.sh\
    && ./configure\
    && make bootstrap\
    && make install
