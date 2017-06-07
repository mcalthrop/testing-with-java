#!/bin/bash -ex

PROGRAM_FILES_DIR="/c/Program Files"
# Check if we are on Windows
[[ -d ${PROGRAM_FILES_DIR} ]] && {
  export JAVA_HOME=${PROGRAM_FILES_DIR}/Java/jdk1.8.0_131
  # NOTE: the ${JDK_BIN} will vary according to the version and location of the JDK you installed:
  JDK_BIN=${JAVA_HOME}/bin
  # Error if specified JDK bin dir does not exist
  [[ ! -d ${JDK_BIN} ]] && {
    echo "ERROR: JDK bin directory does not exist: '${JDK_BIN}'"
    exit 1
  }
  # NOTE: the ${MVN_BIN} will vary according to the version and location of maven you installed:
  MVN_BIN=~/Downloads/apache-maven-3.5.0/bin
  # Error if specified maven bin dir does not exist
  [[ ! -d ${MVN_BIN} ]] && {
    echo "ERROR: maven bin directory does not exist: '${MVN_BIN}'"
    exit 1
  }
  export PATH="${PATH}:${JDK_BIN}:${MVN_BIN}"
}

PWD=$(pwd)
export CLASSPATH=.:${PWD}/src:${PWD}/test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar

mvn -version
java -version
javac -version

javac src/Factorial.java
javac test/FactorialTest.java
java org.junit.runner.JUnitCore FactorialTest
