FROM python:3.10-alpine

WORKDIR /app

RUN if [ "$(uname -m)" = "armv7l" ]; then \
    apk add --no-cache \
        cargo \
        gcc \
        libc-dev \
        libffi-dev \
        musl-dev \
        openssl-dev \
        pkgconfig \
        rust \
   ; fi

COPY gateway/requirements.txt /app

RUN --mount=type=cache,target=/root/.cache/pip pip3 install -r requirements.txt

COPY gateway/main.py /app

ENTRYPOINT ["python3"]
CMD ["main.py"]
