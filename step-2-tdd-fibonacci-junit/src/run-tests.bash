#!/bin/bash -ex

export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar

javac Fibonacci.java FibonacciTest.java
java org.junit.runner.JUnitCore FibonacciTest
