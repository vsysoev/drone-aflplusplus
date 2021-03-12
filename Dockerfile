FROM aflplusplus/aflplusplus

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get full-upgrade -y

ADD ./script.sh /script.sh

ENTRYPOINT [ "/script.sh" ]