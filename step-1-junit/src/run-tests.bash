#!/bin/bash -ex

export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar

javac Factorial.java FactorialTest.java
java org.junit.runner.JUnitCore FactorialTest
