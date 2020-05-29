FROM google/dart-runtime:2.9.0-11.0.dev

ENV DATABASE_HOST=db
ENV DATABASE_PORT=5432
ENV DATABASE_USER=acars
ENV DATABASE_PASS=boxel
ENV DATABASE_NAME=airframes

ENV JSON_INPUT_PORT=5555
ENV NATS_HOST=nats
ENV NATS_PORT=4222

ENV GIT_SOURCE="https://github.com/kevinelliott/acars-aggregation-server.git"
ENV GIT_BRANCH="master"

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

WORKDIR /srv
COPY build.sh build.sh
COPY start.sh start.sh
RUN ls -l

ENTRYPOINT ["/bin/sh", "/srv/start.sh"]
