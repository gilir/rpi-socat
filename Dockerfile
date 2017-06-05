FROM arm32v6/alpine:3.6 
ARG "version=0.1.0-dev"
ARG "build_date=unknown"
ARG "commit_hash=unknown"
ARG "vcs_url=unknown"
ARG "vcs_branch=unknown"
LABEL org.label-schema.vendor="Softonic" \ 
      org.label-schema.name="Socat" \
      org.label-schema.description="Exposes to a defined OUTPUT PORT the INPUT from a TCP endpoint." \
      org.label-schema.usage="/src/README.md" \
      org.label-schema.url="https://github.com/bvis/docker-socat/blob/master/README.md" \
      org.label-schema.vcs-url=$vcs_url \ org.label-schema.vcs-branch=$vcs_branch \
      org.label-schema.vcs-ref=$commit_hash \ org.label-schema.version=$version \
      org.label-schema.schema-version="1.0" \ org.label-schema.docker.cmd.devel="" \
      org.label-schema.docker.params="IN=Input,\
OUT=Output" \
      org.label-schema.build-date=$build_date

ENV "IN=10.0.0.1:9999" \ 
    "OUT=9999" 

RUN apk add --no-cache socat

ENTRYPOINT socat -d -d TCP-L:$OUT,fork TCP:$IN
