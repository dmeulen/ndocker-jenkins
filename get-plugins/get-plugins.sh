#!/bin/bash

JENKINS_HOST="http://192.168.1.253:8080"
USERNAME=$(zenity --entry --text "Username")
PASSWORD=$(zenity --password --text "Password")

java -jar ./jenkins-cli.jar -s ${JENKINS_HOST} groovy --username ${USERNAME} --password ${PASSWORD} = < ./plugins.groovy | sed -e 's/: /:/' > plugins.txt
