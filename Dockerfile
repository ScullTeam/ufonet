FROM python:3.11-slim

RUN python3 setup.py install
RUN git clone https://github.com/epsylon/ufonet.git /ufonet
WORKDIR /ufonet

RUN chmod +x ufonet

ENTRYPOINT ["./ufonet", "--gui"]
