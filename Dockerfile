FROM jupyter/notebook

MAINTAINER Saagie

RUN apt-get update \
	&& apt-get install --no-install-recommends software-properties-common python-software-properties -y \
	&& apt-add-repository ppa:brightbox/ruby-ng \
	&& apt-get update \     
    && apt-get install -y --no-install-recommends \        
		ruby2.3 ruby2.3-dev	       			  \
        libzmq3 libzmq3-dev                    \
        gnuplot-nox                            \
        libgsl0-dev                            \
        libtool autoconf automake              \
        zlib1g-dev                             \
        libsqlite3-dev                         \
        libmagick++-dev imagemagick            \
        libatlas-base-dev             &&       \
    apt-get clean

RUN gem install rbczmq iruby nyaplot distribution

RUN iruby register

ADD examples-notebook ./Ruby-examples
ADD data ./data
CMD jupyter notebook
