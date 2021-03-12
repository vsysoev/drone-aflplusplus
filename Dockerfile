FROM aflplusplus/aflplusplus

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get full-upgrade -y

ADD script.sh /bin/
RUN chmod +x /bin/script.sh

ENTRYPOINT [ "/bin/script.sh" ]