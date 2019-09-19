#!/bin/bash

id

chown jenkins:jenkins /var/jenkins_home

su - jenkins -c "/sbin/tini -s -- /usr/local/bin/jenkins.sh"
