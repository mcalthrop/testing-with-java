#!/bin/bash -ex

PWD=$(pwd)
# NOTE: the following env var is for use with git bash on Windows installations only,
# and will vary according to the version of the JDK you installed:
export PATH="${PATH}:/c/Program Files/Java/jdk1.8.0_131/bin"
export CLASSPATH=.:${PWD}/src:${PWD}/test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar

javac src/Factorial.java
javac test/FactorialTest.java
java org.junit.runner.JUnitCore FactorialTest
