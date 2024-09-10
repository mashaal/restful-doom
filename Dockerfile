FROM debian

RUN apt-get update && apt-get install -y
RUN apt install curl -y
RUN apt install git -y
RUN apt install build-essential -y
RUN apt install m4 -y

WORKDIR /
COPY . /

RUN ./chocpkg/chocpkg/chocpkg install native:autotools
RUN ./configure-and-build.sh

CMD ["src/restful-doom", "-iwad", "./doom1.wad", "-apiport", "6666""]
