# TDD Fibonacci using jUnit


## Overview

### Objectives

- understand the [test-driven development](https://en.wikipedia.org/wiki/Test-driven_development) (TDD) approach to software development
- write an implementation of a [Fibonacci](https://en.wikipedia.org/wiki/Fibonacci_number) class using TDD with jUnit

### Prerequisites

- completion of [Introducing jUnit](../step-1-junit/introducing-junit.md)


## Background

### What is TDD?

The acronym TDD stands for Test-Driven Development.

This is a process where the tests are written before any development is completed &ndash; so that instead of developing the code and then writing tests, the tests drive the development of the code.

Sounds back-to-front, right?

### Why TDD?

When writing a piece of software, we start with a set of _requirements_.

The result we want is an implementation that satisfies all these requirements.

The _Test-driven development_ approach says that we can translate the _requirements_ into _tests_ – **before** even writing any code.

Which means that we will have _automated_ – and _repeatable_ – tests that prove whether the software successfully implements the requirements.

And if a bug is found, we can write one or more tests to cover the scenario that led to the bug before implementing the bug fix.

Additionally, writing tests before implementation forces us to more carefully consider how we structure our code.

And all this further increases our confidence in the code we write!


## The exercise

### Getting started

- you may want to fork this repo
- clone the repo to your local machine
- open the project in your editor or IDE
- open a terminal application, and make sure you are in the `step-2-tdd-fibonacci-junit/src` directory

### Fibonacci sequence

The Fibonacci sequence is a list of numbers whereby each number is the sum of the previous two numbers.

So to demonstrate how TDD works, we will be building a Java class that calculates the _nth_ element in the Fibonacci sequence.

### Assumptions

For the purposes of this exercise, we will assume that:

- the Fibonacci sequence starts with **1**
- indexes for the series will be **zero-based**
- negative indexes are invalid

So combining the Fibonacci numbers and their indexes would look like this:

|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
| **Index**  | `0`  | `1`  | `2`  | `3`  | `4`  |  `5` | `6`  | `7` |
| **Fibonacci number** | `1` | `1` | `2` | `3` | `5` | `8` | `13` | `21` |

Which means, for example, that passing in a parameter of `6` would return `13`.


## The first test

### Write the test

Open `FibonacciTest.java` in your editor or IDE. We will write tests in the same way that we wrote tests in the previous lesson:

```java
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

public class FibonacciTest {
    private Fibonacci fibonacci;

    @Before
    public void setUp() {
        fibonacci = new Fibonacci();
    }

    @Test
    public void calculate_0() {
        int testIndex = 0;
        int expectedResult = 1;

        assertEquals(expectedResult, fibonacci.calculate(testIndex));
    }
}
```

### Run the test

Use the `run-tests.bash` script provided in the `step-2-tdd-fibonacci-junit` directory:

```bash
./run-tests.bash
```

You should see something like this:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Fibonacci.java FibonacciTest.java
FibonacciTest.java:18: error: cannot find symbol
        assertEquals(expectedResult, fibonacci.calculate(testIndex));
                                              ^
  symbol:   method calculate(int)
  location: variable fibonacci of type Fibonacci
1 error
```

This is exactly what we would expect when taking a TDD approach: we have written a test for code that has not yet been implemented, so the test will fail.

### Write code for the test

In its most basic form, TDD requires that you only write enough code &ndash; and nothing more &ndash; to make the failing test pass.

So let's add enough code to `FibonacciTest.java` to make the failing test pass:

```java
class Fibonacci {
    public int calculate(int index) {
        return 1;
    }
}
```

### Run the test again

And you should see output like this:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Fibonacci.java FibonacciTest.java
+ java org.junit.runner.JUnitCore FibonacciTest
JUnit version 4.12
.
Time: 0.013

OK (1 test)
```

We have completed writing the first test, so it's now time to repeat the process until we believe we have written sufficient tests.


## The second test

### Write the test

Looking at the rules that govern Fibonacci sequence, it is evident that the second number (i.e., index `1`) in the sequence is not derived from the its predecessors &ndash; it can't be, because there are not two predecessors.

So it seems logical that this is the next test we should add:

```java
    @Test
    public void calculate_1() {
        int testIndex = 1;
        int expectedResult = 1;

        assertEquals(expectedResult, fibonacci.calculate(testIndex));
    }
```

### Run the tests

You should see something like this:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Fibonacci.java FibonacciTest.java
+ java org.junit.runner.JUnitCore FibonacciTest
JUnit version 4.12
..
Time: 0.012

OK (2 tests)
```

Interesting: in this case, we have not introduced an error. We will continue using the TDD principle of only writing enough code to make the tests pass.


## The third test

### Write the test

Now write a test to calculate a different number in the sequence – `6`, for example:

```java
    @Test
    public void calculate_6() {
        int testIndex = 6;
        int expectedResult = 13;

        assertEquals(expectedResult, fibonacci.calculate(testIndex));
    }
```

### Run the tests

You should see something like this:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Fibonacci.java FibonacciTest.java
+ java org.junit.runner.JUnitCore FibonacciTest
JUnit version 4.12
...E
Time: 0.016
There was 1 failure:
1) calculate_6(FibonacciTest)
java.lang.AssertionError: expected:<13> but was:<1>
	at org.junit.Assert.fail(Assert.java:88)
	at org.junit.Assert.failNotEquals(Assert.java:834)
	at org.junit.Assert.assertEquals(Assert.java:645)
	at org.junit.Assert.assertEquals(Assert.java:631)
	at FibonacciTest.calculate_6(FibonacciTest.java:34)
	...long Java stacktrace...

FAILURES!!!
Tests run: 3,  Failures: 1
```

This is what we would expect, as we have not actually written the code that implements the Fibonacci functionality.

### Write the code for the test

Finally we get to writing the meat of the code!

```java
class Fibonacci {
    public int calculate(int index) {
        if (index == 0 || index == 1) {
            return 1;
        }

        return calculate(index - 1) + calculate(index - 2);
    }
}
```

### Run the tests again

And you should see output like this:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Fibonacci.java FibonacciTest.java
+ java org.junit.runner.JUnitCore FibonacciTest
JUnit version 4.12
...
Time: 0.008

OK (3 tests)
```

We have now implemented the basic Fibonacci functionality.


## What next?

Looking at the requirements, we can see that a negative number as a parameter is considered invalid.

So you can now use a TDD approach to develop that functionality. Refer to the tests and code in the previous lesson for relevant syntax.

### Final output

The final output of running `./run-tests.bash` should look something like this:

```
+ export CLASSPATH=.:src:test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar
+ CLASSPATH=.:src:test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar
+ javac src/Fibonacci.java
+ javac test/FibonacciTest.java
+ java org.junit.runner.JUnitCore FibonacciTest
JUnit version 4.12
....
Time: 0.014

OK (4 tests)
```

## Conclusion

### What we've covered

- explained the principles behind a TDD approach to software development
- used TDD with jUnit to test and implement a simple Fibonacci class in Java

### Further reading

- https://martinfowler.com/bliki/TestDrivenDevelopment.html
- http://agiledata.org/essays/tdd.html
- http://www.drdobbs.com/architecture-and-design/dr-dobbs-agile-update-0110/222301633
