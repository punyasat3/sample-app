#!/bin/bash


additional_flags=$@;
if [ -z "${BUILD_NUMBER}" ]; then
  cd /workspace
fi

mvn -U clean install 
#terraform --version
