#!/bin/bash

JENKINS_HOST="http://ci.anna.lan"
USERNAME=$(zenity --entry --text "Username")
PASSWORD=$(zenity --password --text "Password")

java -jar ./jenkins-cli.jar -s ${JENKINS_HOST} -auth ${USERNAME}:${PASSWORD} groovy = < ./latest-plugins.groovy | sed -e 's/: /:/' > plugins.txt
