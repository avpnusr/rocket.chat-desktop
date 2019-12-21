FROM debian:9-slim

MAINTAINER avpnusr

RUN     apt-get update \
        && apt-get upgrade -y \
        && apt-get install -y libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libappindicator3-1 libsecret-1-0 desktop-file-utils wget curl \
        && RCPKG=$(curl -s https://rocket.chat/install | grep -Eo -m1 "http(s?):\/\/[^ \"\(\)\<\>]*/[a-zA-Z0-9./?=_-]*amd64.deb")  \
        && wget -O /tmp/rocket-chat.deb "$RCPKG" \
        && dpkg -i /tmp/rocket-chat.deb \
        && apt-get purge --auto-remove -y wget curl \
        && apt-get clean && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/* \
        && useradd -r -m -u 1000 -G audio,video rocket

USER rocket

ENTRYPOINT [ "/usr/bin/rocketchat-desktop", " --no-sandbox" ]
