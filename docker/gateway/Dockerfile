FROM python:3.10-alpine

WORKDIR /app

COPY gateway/requirements.txt /app
RUN --mount=type=cache,target=/root/.cache/pip pip3 install -r requirements.txt

COPY gateway/main.py /app

ENTRYPOINT ["python3"]
CMD ["main.py"]
