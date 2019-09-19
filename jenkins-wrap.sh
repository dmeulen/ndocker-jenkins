#!/bin/bash

id

chown jenkins:jenkins /var/jenkins_home

exec su - jenkins -c "/sbin/tini -- /usr/local/bin/jenkins.sh"
