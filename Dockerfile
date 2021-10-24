FROM apline:latest as downloader
ARG PODBOT_ZIP_URL='https://github.com/APGRoboCop/podbot_mm/releases/download/V3B24-APG/podbot_full_V3B24.zip'
WORKDIR /data
RUN apk update && apk add --no-cache ca-certificates curl unzip
RUN curl -L "${PODBOT_ZIP_URL}" -o podbot.zip && unzip podbot.zip

FROM hlds/server
COPY --from=downloader /data cstrike/addons
RUN unzip ./podbot.zip -x $(<.)\
            'podbot/pod_v3 docs/' \
            'podbot/pod_v3 docs/**' \
            podbot/botchats/ \
            podbot/podbot_mm.dll \
            podbot/readme.txt \
            podbot/versionhistory.txt \
            -d cstrike/addons && \
    echo 'linux addons/podbot/podbot_mm_i386.so' >> cstrike/addons/metamod/plugins.ini
RUN rm podbot.zip
