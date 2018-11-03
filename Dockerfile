FROM hlds/server:alpha

WORKDIR /opt/hlds
RUN apt-get update && apt-get install -y --no-install-recommends curl unzip && \
    curl -L "http://filebase.bots-united.com/uploads/podbot_full_V3B22.zip" \
         -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:63.0) Gecko/20100101 Firefox/63.0" \
         -o podbot.zip && \
    unzip ./podbot.zip -x \
            podbot/pod_v3\ docs/ \
            podbot/pod_v3\ docs/** \
            podbot/botchats/ \
            podbot/botchats/** \
            podbot/podbot_mm.dll \
            podbot/readme.txt \
            podbot/versionhistory.txt \
            -d cstrike/addons && \
    echo 'linux addons/podbot/podbot_mm_i386.so' >> cstrike/addons/metamod/plugins.ini && \
    apt-get purge -y curl unzip
COPY podbot/* cstrike/addons/podbot/
