FROM node:14
MAINTAINER Romuald @ Le Menu <romuald@lemenu.tech>

ENV HUGO_VERSION 0.72.0
ENV HUGO_EXTENDED_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit
ENV HUGO_CHECKSUM 11c46ecc3ad6d96f94515358e5528d01dfe88f4956b56027c85e9a516348ef12

# Install Firebase tools
RUN npm install -g firebase-tools

# Download and install hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_EXTENDED_BINARY}.tar.gz /tmp/hugo.tar.gz
# TODO(rcari): Verify Hugo checksum
RUN mkdir /usr/local/hugo \
	&& tar xzf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
	&& ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
	&& rm /tmp/hugo.tar.gz
