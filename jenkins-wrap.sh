#!/bin/bash

chown jenkins:jenkins /var/jenkins_home

exec /sbin/tini -- /usr/local/bin/jenkins.sh
