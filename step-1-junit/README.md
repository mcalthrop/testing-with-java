[[home]](../README.md)

# Introducing jUnit


## Overview

### Objectives

- understand what jUnit is and how it works
- write a simple Java class and some jUnit tests for it
- automate the test running with a simple shell script
- learn some simple optimisation for jUnit tests
- write a test to check for a thrown exception

### Prerequisites

- execution of the [Setup](../step-0-setup/README.md) procedure


## Getting started

### What is jUnit?

JUnit is a unit testing framework for the Java programming language. It enables us to write repeatable tests that can be incorporated into a Continuous Integration workflow.

### Fork and clone

- you may want to fork this repo
- clone the repo to your local machine
- open the project in your editor or IDE
- open a terminal application, and make sure you are in the `step-1-junit` directory

### Observe the directory hierarchy

Note the directory hierarchy in the starter code:

```
├── src
│   └── Factorial.java
└── test
    ├── FactorialTest.java
    ├── hamcrest-core-1.3.jar
    └── junit-4.12.jar
```

There is a clear separation between the source code (the `src` directory), and tests written against that source (the `test` directory).

This is a very common pattern used when arranging source code.

### Create a simple Java class

> Note: the code described below is an adaptation of [https://github.com/junit-team/junit4/wiki/Getting-started](https://github.com/junit-team/junit4/wiki/Getting-started).
> To keep things simple, the starter code in this repo already contains the Jar files needed to run the jUnit tests.

We'll take a simple requirement: write a Java class to implement [factorial](https://en.wikipedia.org/wiki/Factorial) functionality.

Open the empty `src/Factorial.java` file, enter the following code, and save the file:

```java
public class Factorial {
    public int calculate(int start) {
        if (start < 0) {
            throw new IllegalArgumentException("Factorials are defined only on non-negative integers.");
        }

        int result = start;

        if (result > 1) {
            result = start * calculate(start - 1);
        }

        return result;
    }
}
```

> NOTE: this is a slightly contrived example, and could be simplified (for example, the `calculate()` method only needs to be `static`).
> However, the main purpose of this example is to enable us to see how a set of jUnit tests can be developed, including the ability to use `@Before` to define steps that are common to all tests.


## Testing the code

### How would you manually test this?

Consider how you would manually test this. How would you do it?

> Hopefully it will be evident that although it would probably be ok to manually test only this class, once other components are introduced into the software, manual testing quickly becomes an inadequate method of testing.

### Write a test class

Let's now write a class that jUnit can use to test the `Factorial` class.

Open the empty `test/FactorialTest.java` file, enter the following code, and save the file:

```java
import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class FactorialTest {
    @Test
    public void calculate_0() {
        Factorial factorial = new Factorial();
        int testStartValue = 0;
        int expectedResult = 0;

        assertEquals(expectedResult, factorial.calculate(testStartValue));
    }
}
```

Note each part of that test class:

- imports 
- the name of the test class is the class we are going to test, plus `Test`
- the `@Test` annotation indicates the start of a test
- the name of the method gives an indicator of what we are testing
- within the test:
  - get a new instance of the class we want to test
  - and a variable to contain the expected result
  - and a variable that contains the actual result
  - the naming of these variables describes (documents) their function

### Run the test

In order to be able to run the test, we need to first compile the two Java classes:

```bash
javac -classpath .:src:test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar src/Factorial.java test/FactorialTest.java
```

Then we can run the test:

```bash
java -classpath .:src:test:test/junit-4.12.jar:test/hamcrest-core-1.3.jar org.junit.runner.JUnitCore FactorialTest
```

### Automate running the test

Having to specify the class path before every command is tiresome. We can automate the whole process by using a simple shell script, which has been provided in the `run-tests.bash` file in the `step-1-junit` directory:

```bash
./run-tests.bash
```

Sample output:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Factorial.java FactorialTest.java
+ java org.junit.runner.JUnitCore FactorialTest
JUnit version 4.12
.
Time: 0.015

OK (1 test)
```

## Taking it further

We'll now add a couple more tests, look at a simple way of optimising the tests, and test for a thrown exception when an invalid parameter is provided.

### Test setting the start value

Let's add a test to check the result when we pass in `1` as a parameter:

```java
    @Test
    public void calculate_1() {
        Factorial factorial = new Factorial();
        int testStartValue = 1;
        int expectedResult = 1;

        assertEquals(expectedResult, factorial.calculate(testStartValue));
    }
```

Note the simple convention we are using when naming each test – each method is made up of two parts, separated by the `_` character:

- the name of the method we are testing (in this case, we are only testing the `calculate()` method)
- the value passed to the `calculate()` method

This is a useful way (but not the only way) to name test methods; you may find other ways. The main thing is for the naming convention to be readable and consistent.

Run the tests again:

```bash
./run-tests.bash
```

Sample output:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Factorial.java FactorialTest.java
+ java org.junit.runner.JUnitCore FactorialTest
JUnit version 4.12
..
Time: 0.012

OK (2 tests)
```

## Some optimisation

### DRY: Don't Repeat Yourself

If you inspect the test class, you will notice that a new instance of the `Factorial` class is instantiated in each test.

A common pattern you will find in testing frameworks for most programming languages is to be able to specify a block of code that is automatically run before each test.

With jUnit, we use the `@Before` annotation.

Here's what we will do:

- import the `Before` annotation
- declare a private `factorial` variable to hold the `Factorial` instance on the test class – this will be accessible by all tests in the class
- add a `@Before` code block in the test class – this will instantiate the `Factorial` class
- remove the code that instantiates the `Factorial` class within each test, and refactor it to use the private `factorial` class variable

> Implement each of those changes in `test/FactorialTest.java`

Once you have finished making those changes, the test class will look like this:

```java
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

public class FactorialTest {
    private Factorial factorial;

    @Before
    public void setUp() {
        factorial = new Factorial();
    }

    @Test
    public void calculate_0() {
        int testStartValue = 0;
        int expectedResult = 0;

        assertEquals(expectedResult, factorial.calculate(testStartValue));
    }

    @Test
    public void calculate_1() {
        int testStartValue = 1;
        int expectedResult = 1;

        assertEquals(expectedResult, factorial.calculate(testStartValue));
    }
}
```

Note a key unit testing principle: _each test should test one thing, and one thing only_. This simplifies each test, and makes it easier to track down any test errors that occur.

### Add another test

We should add another test to check a number greater than 1:

```java
    @Test
    public void calculate_5() {
        int testStartValue = 5;
        int expectedResult = 120;

        assertEquals(expectedResult, factorial.calculate(testStartValue));
    }
```

Then run the tests again.

### What if the parameter is invalid?

There is a condition where the parameter passed in is invalid: it is not possible to calculate the factorial value of a negative number. In this case, the `factorial()` method will throw an `IllegalArgumentException`.

So we can add a test for this as follows:

```java
    @Test(expected=IllegalArgumentException.class)
    public void calculate_negative() {
        factorial.calculate(-5);
    }
```

Note:

- new `@Test` syntax for the annotation
- there is no actual assertion within the test itself – this is implicit in the annotation
- and the test will fail if the specified exception is _not_ thrown (test it out yourself!)

Then re-run the tests.

### Final output

The final output of running `./run-tests.bash` should look something like this:

```
+ export CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ CLASSPATH=.:junit-4.12.jar:hamcrest-core-1.3.jar
+ javac Factorial.java FactorialTest.java
+ java org.junit.runner.JUnitCore FactorialTest
JUnit version 4.12
....
Time: 0.013

OK (4 tests)
```


## Conclusion

### What we've covered

- what jUnit is
- how to write jUnit tests
- and automate the testing process with a simple shell script
- and optimise tests using `@Before`
- and check for an exception thrown when expected

### Further reading

- http://junit.org/junit4/
- https://github.com/junit-team/junit4
- https://en.wikipedia.org/wiki/Hamcrest
