FROM jenkins/jenkins:2.195

ENV \
  INSTALL="libcairo2 libcairo2-dev ruby ruby-dev rubygems gcc make python-setuptools python3-setuptools python3-pip python3-dev apt-transport-https ca-certificates curl gnupg2 software-properties-common" \
  DOCKER="docker-ce"

USER root
RUN apt-get update && \
    apt-get install -y ${INSTALL} && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y ${DOCKER}
RUN gem install --no-ri --no-rdoc fpm
RUN pip3 install --upgrade virtualenv
RUN usermod -a -G docker jenkins
USER jenkins

COPY get-plugins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
