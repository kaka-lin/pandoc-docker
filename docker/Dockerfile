FROM pandoc/latex:2.19-ubuntu

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata locales sudo pkg-config \
    git wget vim unzip \
    # Build essentials
    build-essential cmake ninja-build g++ \
    python3-dev python3-pip python3-setuptools \
    # latex toolchain
    ghostscript \
    lmodern \
    texlive \
    texlive-lang-cjk \
    texlive-lang-japanese \
    texlive-fonts-extra \
    texlive-luatex \
    texlive-xetex \
    xzdec \
    # fonts
    fonts-dejavu \
    fonts-font-awesome \
    fonts-lato \
    fonts-liberation \
    fonts-noto \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    fonts-noto-color-emoji \
    fonts-noto-core \
    fonts-noto-extra \
    fonts-noto-mono \
    fonts-arphic-uming \
    fonts-ubuntu \
    # wkhtmltopdf
    wkhtmltopdf 

RUN apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

# Set timezone
ENV TZ=Asia/Taipei
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Set locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# LATEX
ADD latex_requirements.txt ./
RUN tlmgr init-usertree && \
    tlmgr install `echo $(grep -v '^#' latex_requirements.txt )` && \
    # update the font map
    updmap-sys
