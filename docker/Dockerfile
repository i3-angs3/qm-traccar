FROM alpine:3.20

ENV TRACCAR_VERSION 6.5
ENV TRACCAR_REPO_URL github.com
ENV TRACCAR_GROUP traccar
ENV TRACCAR_REPO traccar
ENV QM_TRACCAR_VERSION 6.5.1
ENV QM_REPO_URL github.com
ENV QM_GROUP i3-angs3
ENV QM_REPO qm-traccar

WORKDIR /opt/traccar

RUN /bin/sh -c set -ex; \
    apk add --no-cache --no-progress \
      openjdk17-jre-headless \
      wget; \
    wget -qO /tmp/traccar.zip https://$QM_REPO_URL/$QM_GROUP/$QM_REPO/releases/download/v$QM_TRACCAR_VERSION/traccar-other-$QM_TRACCAR_VERSION.zip; \
    unzip -qo /tmp/traccar.zip -d /opt/traccar; \
    rm /tmp/traccar.zip; \
    apk del wget

ENTRYPOINT ["java", "-Xms1g", "-Xmx1g", "-Djava.net.preferIPv4Stack=true"]

CMD ["-jar", "tracker-server.jar", "conf/traccar.xml"]