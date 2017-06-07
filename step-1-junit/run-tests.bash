#!/bin/bash -e

# NOTE: the ${JDK_BIN} env var is for use with git bash on Windows installations only,
# and will vary according to the version of the JDK you installed:
PROGRAM_FILES_DIR="/c/Program Files"
JDK_BIN="${PROGRAM_FILES_DIR}/Java/jdk1.8.0_131/bin"
# Error if:
# - we are on Windows (ie, the "/c/Program Files" dir exists), AND
# - specified JDK bin dir does not exist
[[ -d ${PROGRAM_FILES_DIR} && ! -d ${JDK_BIN} ]] && {
  echo "ERROR: JDK bin directory does not exist: '${JDK_BIN}'"
  exit 1
}
set -x
export PATH="${PATH}:${JDK_BIN}"
PWD=$(pwd)
export CLASSPATH=.:${PWD}/src:${PWD}/test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar

javac src/Factorial.java
javac test/FactorialTest.java
java org.junit.runner.JUnitCore FactorialTest
