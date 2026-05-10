FROM registry.access.redhat.com/ubi8/ubi:8.9-1160
WORKDIR /usr/src/app

ENV NC_DOCKER 0.6
ENV NODE_ENV production
ENV PORT 8080
ENV NC_TOOL_DIR=/usr/app/data/
RUN yum install wget -y
RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init

RUN yum install -y \
    nodejs \
    tar \
    curl \
    jq

EXPOSE 8080
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Start Nocodb
CMD ["/usr/src/appEntry/start.sh"]