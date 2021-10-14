FROM python:3.7.4

ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# mirrors.tencentyun.com 为腾讯云内网镜像地址，非内网地址需要改成 mirrors.cloud.tencent.com
RUN sed -i 's+http://deb.debian.org+http://mirrors.cloud.tencent.com+' /etc/apt/sources.list && \
  sed -i 's+http://security.debian.org+http://mirrors.cloud.tencent.com+' /etc/apt/sources.list

# RUN apt-get update && apt-get install -y ffmpeg libmp3lame0 && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y rsync && rm -rf /var/lib/apt/lists/*

ADD envconsul_0.9.0_linux_amd64 /usr/local/bin/envconsul

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
