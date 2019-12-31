#!/bin/bash


additional_flags=$@;
if [ -z "${BUILD_NUMBER}" ]; then
  cd /workspace
fi


sudo mvn clean package
#mvn -U clean install 
#terraform --version
