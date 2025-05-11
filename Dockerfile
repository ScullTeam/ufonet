FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpython3.11-dev python3-pycurl python3-geoip python3-whois \
    python3-cryptography python3-requests libgeoip1 libgeoip-dev \
    && pip install --upgrade pip \
    && pip install pycurl GeoIP python-geoip pygeoip requests whois scapy pycryptodomex duckduckgo-search \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/epsylon/ufonet.git /ufonet
WORKDIR /ufonet

RUN chmod +x ufonet

ENTRYPOINT ["./ufonet", "--gui"]
