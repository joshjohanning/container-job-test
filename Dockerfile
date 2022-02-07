FROM python:3.8.6-slim-buster
# install git
RUN apt-get update \
  && apt-get install -y --no-install-recommends git \
  && apt-get purge -y --auto-remove \
  && rm -rf /var/lib/apt/lists/*
 
RUN mkdir /usr/src/app /usr/src/cert && chmod -R 777 /usr/src/app /usr/src/cert
ENV PYTHONPATH /usr/src/app
ENV PATH="/usr/src/app:$PATH"
 
RUN chmod -R 777 /usr/src/app
# set as a non root user
USER 1001
 
# on self hosted, run: 'sudo chmod -R 777 _work' on the actions-runner work directory

