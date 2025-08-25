FROM python:3.11-alpine AS builder

WORKDIR /usr/src/app

COPY requirement.txt ./
RUN pip3 install -q --no-cache-dir -r requirement.txt -t ./
COPY . .
ADD https://raw.githubusercontent.com/nexchard/instantbox-images/master/manifest.json .


FROM nexsre/instantbox-python3:3.11

LABEL \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="instantbox" \
  org.label-schema.vcs-url="https://github.com/nexchard/instantbox" \
  maintainer="Nexsre Team <team@nexsre.com>"

ENV SERVERURL=""

WORKDIR /app
COPY --from=builder /usr/src/app/ .

EXPOSE 65501
CMD ["inspire.py"]

ARG BUILD_DATE
ARG VCS_REF
LABEL \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF
