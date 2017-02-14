# https://hub.docker.com/r/frekele/gradle/
FROM frekele/gradle:latest

MAINTAINER Instrumentisto Team <developer@instrumentisto.com>


# Install Flash Player and its dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
            libnss3 libgtk2.0-0 \
            xvfb xauth \

 && curl -L -o /tmp/flash_player.tar.gz \
         https://fpdownload.macromedia.com/pub/flashplayer/updaters/24/flash_player_sa_linux_debug.x86_64.tar.gz \
 && tar -xzf /tmp/flash_player.tar.gz -C /tmp \
 && mv /tmp/flashplayerdebugger /usr/local/bin/ \
 && ln -sn flashplayerdebugger /usr/local/bin/gflashplayer \
 && mkdir -p /usr/local/doc/flashplayerdebugger \
 && mv /tmp/LGPL/* /usr/local/doc/flashplayerdebugger/ \

 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
           /tmp/*

ENV FLASH_PLAYER_EXE='/usr/local/bin/gflashplayer' \
    DISPLAY=':99.0' \
    RESOLUTION='1024x768x24'


# Install Flex SDK and its dependencies
ENV FLEX_HOME='/flex-sdk'

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
            ant \
            rsync \
            bzip2 \

 && curl -L -o /tmp/flex-sdk.tar.gz \
         http://apache.cbox.biz/flex/4.15.0/binaries/apache-flex-sdk-4.15.0-bin.tar.gz \
 && tar -xzf /tmp/flex-sdk.tar.gz -C /tmp \
 && mv /tmp/apache-flex-sdk-* $FLEX_HOME \
 && cd $FLEX_HOME \
 && ant -f installer.xml -Dair.sdk.version=2.6 \
                         -Djava.awt.headless=true \
                         -Dinput.air.download=y \
                         -Dinput.fontswf.download=y \
                         -Dinput.flash.download=y \

 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
            bzip2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
           /tmp/*

ENV PATH="$FLEX_HOME/bin:$PATH"


# Prepare application directory
RUN mkdir -p /app

WORKDIR /app

ENTRYPOINT []
#ENTRYPOINT xvfb-run -e /dev/stdout --server-args="$DISPLAY -screen 0 $RESOLUTION -ac +extension RANDR" $0 $*

CMD gradle
