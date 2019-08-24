FROM hlds/server

ARG PODBOT_ZIP_URL='http://filebase.bots-united.com/uploads/podbot_full_V3B22.zip'
ARG CURL_UA='User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:63.0) Gecko/20100101 Firefox/63.0'

RUN apt-get update && apt-get install -y --no-install-recommends curl unzip
RUN curl -L "${PODBOT_ZIP_URL}" -H "${CURL_UA}" -o podbot.zip && \
    unzip ./podbot.zip -x \
            'podbot/pod_v3 docs/' \
            'podbot/pod_v3 docs/**' \
            podbot/botchats/ \
            podbot/podbot_mm.dll \
            podbot/readme.txt \
            podbot/versionhistory.txt \
            -d cstrike/addons && \
    echo 'linux addons/podbot/podbot_mm_i386.so' >> cstrike/addons/metamod/plugins.ini
RUN rm podbot.zip
