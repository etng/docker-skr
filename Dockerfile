FROM ubuntu

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
&& sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
&& apt-get update \
&& apt-get install --yes netcat vim git

WORKDIR /apps
ADD README.md .
EXPOSE 1024
CMD ["sh", "-c", "nohup nc -lk 1024 2>&1 1>logs/1024.log && tail -f README.md "]
