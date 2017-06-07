#!/bin/bash -e

# NOTE: the ${JDK_BIN} env var is for use with git bash on Windows installations only,
# and will vary according to the version of the JDK you installed:
JDK_BIN="/c/Program Files/Java/jdk1.8.0_131/bin"
[[ ! -d ${JDK_BIN} ]] && {
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
