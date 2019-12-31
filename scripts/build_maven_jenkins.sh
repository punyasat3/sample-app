#!/bin/bash


additional_flags=$@;
if [ -z "${BUILD_NUMBER}" ]; then
  cd /workspace
fi


sudo mvn -s settings.xml clean package
#mvn -U clean install 
#terraform --version
