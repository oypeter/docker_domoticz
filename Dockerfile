FROM cgatay/domoticz:3.8356-beta
MAINTAINER oypeter <j@oypeter.com>

RUN apk add --no-cache gcc g++ make libffi-dev python3-dev && \
         pip3 install --upgrade pip && \
         pip3 install progressbar33 Crypto broadlink pyaes
COPY plugin_broadlink.tar.gz /
RUN tar -zxvf plugin_broadlink.tar.gz && \
    mkdir -p /src/domoticz/plugins/BroadlinkRM2 && \
    cp /plugin_broadlink/* /src/domoticz/plugins/BroadlinkRM2/ && \
    cp -r /usr/lib/python3.5/site-packages/broadlink /src/domoticz/plugins/BroadlinkRM2/ && \
    cp -r /usr/lib/python3.5/site-packages/pyaes /src/domoticz/plugins/BroadlinkRM2/ && \
    sed -i -e 's/"".join/b"".join/g' /src/domoticz/plugins/BroadlinkRM2/broadlink/__init__.py

