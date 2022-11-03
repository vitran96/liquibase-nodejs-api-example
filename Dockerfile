FROM docker.io/node:16.6.1 as base

WORKDIR /

RUN tar -czf /node_modules.tar.gz /usr/local/lib/node_modules
RUN tar --exclude='docker-entrypoint.sh' -czf /binary.tar.gz /usr/local/bin
RUN tar -czf /others.tar.gz /opt

FROM docker.io/liquibase/liquibase

USER root

COPY --from=base /node_modules.tar.gz /node_modules.tar.gz
RUN tar -C / -xzf /node_modules.tar.gz
# WORKDIR /usr/local/lib/node_modules
# RUN chown liquibase:liquibase .

COPY --from=base /binary.tar.gz /binary.tar.gz
RUN tar -C / -xzf /binary.tar.gz
# WORKDIR /usr/local/bin
# RUN chown liquibase:liquibase .

COPY --from=base /others.tar.gz /others.tar.gz
RUN tar -C / -xzf /others.tar.gz
# WORKDIR /opt
# RUN chown liquibase:liquibase .

ENV NODE_ENV=production

# USER liquibase

COPY ./ /src/

WORKDIR /src/

RUN npm i
