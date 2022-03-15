FROM alpine:3.15.0

RUN apk update && apk add --no-cache py3-pip python3-dev mariadb-dev build-base && rm -f /var/cache/apk/*

ENV PATH="/home/myuser/.local/bin:${PATH}"

RUN pip3 install --upgrade pip

RUN mkdir /app

RUN adduser -D myuser
USER myuser

WORKDIR /app

COPY --chown=myuser:myuser requirements.txt requirements.txt

RUN pip3 install --user -r requirements.txt

COPY --chown=myuser:myuser . .

CMD [ "python3", "main.py"]
