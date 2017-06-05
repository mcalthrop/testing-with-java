#!/bin/bash -ex

export CLASSPATH=.:src:test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar

javac src/Factorial.java
javac test/FactorialTest.java
java org.junit.runner.JUnitCore FactorialTest
