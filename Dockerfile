FROM google/dart-runtime:2.12.0-96.0.dev

ENV DATABASE_HOST=db
ENV DATABASE_PORT=5432
ENV DATABASE_USER=acars
ENV DATABASE_PASS=boxel
ENV DATABASE_NAME=airframes

ENV NATS_HOST=nats
ENV NATS_PORT=4222

ENV INGEST_ACARSDEC_PORT=5550
ENV INGEST_ACARSDEC2_PORT=5551
ENV INGEST_DUMPVDL2_PORT=5552
ENV INGEST_VDLM2DEC_PORT=5555
ENV INGEST_JAERO_C_ACARS_PORT=5561
ENV INGEST_JAERO_C_ADSC_PORT=5562
ENV INGEST_JAERO_L_BAND_ACARS=5571

ENV GIT_SOURCE="https://github.com/kevinelliott/acars-aggregation-server.git"
ENV GIT_BRANCH="last-good"

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update && apt install -y protobuf-compiler
# RUN cd /tmp && wget $PROTOC_URL && \
#     unzip protoc-${PROTOC_VERSION}-linux-x86_32.zip && \
#     ls -l && \
#     cp bin/protoc /usr/local/bin/protoc && \
#     ls -l /usr/local/bin/protoc && \
#     cp -rf include/* /usr/local/include/

# RUN apt update && apt install -y autoconf automake libtool curl make g++ unzip
# RUN git clone https://github.com/protocolbuffers/protobuf.git
# RUN cd protobuf && git submodule update --init --recursive && \
#     ./autogen.sh && ./configure
# RUN cd protobuf && make && make check && make install && ldconfig

RUN which protoc
RUN pub global activate protoc_plugin

RUN /usr/bin/protoc --dart_out=. lib/protos/airframes.proto

WORKDIR /srv
COPY build.sh build.sh
COPY start.sh start.sh
RUN ls -l

ENTRYPOINT ["/bin/sh", "/srv/start.sh"]
