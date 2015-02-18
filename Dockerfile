FROM ubuntu
MAINTAINER Mat Kelly <mkelly@cs.odu.edu>

RUN apt-get update && apt-get -y install git make perl cpanminus python curl libcurl3 libcurl3-dev supervisor build-essential

ADD . /warrick
WORKDIR /warrick
RUN chmod a+x *.sh *.pl

# Install Perl package dependencies
./perl_package_dep_installer.sh

VOLUME ["/output"]

ENTRYPOINT ["./warrick.pl", "-D", "/output"]
