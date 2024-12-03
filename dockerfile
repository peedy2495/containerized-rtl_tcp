# Basisimage
FROM alpine:latest

# Installiere rtl-sdr und ermittle die Version
RUN apk add --no-cache rtl-sdr && \
    ver=$(apk version rtl-sdr|grep rtl-sdr|awk -F' = ' '{print $2}') && \
    echo $ver > /version.txt

LABEL org.opencontainers.image.description rtl_tcp version:$(cat /version.txt) for providing receiver data via network

# Exponiere Port für rtl_tcp
EXPOSE 1234

# Startbefehl für rtl_tcp
CMD ["rtl_tcp", "-a", "0.0.0.0", "-p", "1234"]
