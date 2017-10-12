FROM jenkins/jenkins:2.73.2

ENV \
  INSTALL="libcairo2 libcairo2-dev ruby ruby-dev rubygems gcc make"

USER root
RUN apt-get update && \
    apt-get install -y ${INSTALL}
RUN gem install --no-ri --no-rdoc fpm
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
