# Basisimage
FROM alpine:latest

# Installiere rtl-sdr und ermittle die Version
RUN apk add --no-cache rtl-sdr && \
    ver=$(apk version rtl-sdr|grep rtl-sdr|awk -F' = ' '{print $2}') && \
    echo $ver > /version.txt

# Exponiere Port für rtl_tcp
EXPOSE 1234

# Startbefehl für rtl_tcp
CMD ["rtl_tcp", "-n", "10", "-a", "0.0.0.0", "-p", "1234"]
