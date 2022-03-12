FROM alpine:3.15.0

RUN apk update && apk add py3-pip python3-dev
RUN apk add --no-cache mariadb-dev build-base && rm -f /var/cache/apk/*

RUN mkdir /app

WORKDIR /app

COPY . .

#RUN /usr/bin/python3 -m pip install --upgrade pip

RUN pip3 install --upgrade pip
#RUN pip3 freeze >> requirements.txt
RUN pip3 install -r requirements.txt

CMD [ "python3", "main.py"]

#ENTRYPOINT ["tail", "-f", "/dev/null"]
