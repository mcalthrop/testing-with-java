[[home]](../README.md)

# Introducing Maven


## Overview

### Objectives

- understand dependency management concepts
- understand the basics of how [Maven](https://maven.apache.org/) works
- apply this to setting up a Java project with jUnit tests

### Prerequisites

- completion of [Introducing jUnit](../step-1-junit/README.md)
- completion of [TDD Fibonacci using jUnit](../step-2-tdd-fibonacci-junit/README.md)


## Maven basics

### What is Maven?

[Maven](https://maven.apache.org/what-is-maven.html) is a tool for building and managing any Java-based project.

It is very powerful, and consequently complex. This lesson aims to demonstrate a simple use of Maven, focusing primarily on _dependency management_ in the context of writing jUnit tests.

### What is dependency management?

In the previous lessons, to keep things simple, we have stored external libraries (JAR files, in our case) in the source code.

This is considered bad practice – instead, we should be using dependency management, which allows us to:

- define one or more external libraries, and the version of each
- define a build process that retrieves those libraries and uses them to compile and run our code
 

### The Project Object Model

The whole Maven process revolves around a file called `pom.xml`, where POM stands for [Project Object Model](https://maven.apache.org/pom.html).

This is an XML file that contains configuration data that provides instructions to Maven.

A minimal `pom.xml` with one dependency might look like this:

```xml
<project>
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.mycompany.app</groupId>
    <artifactId>my-app</artifactId>
    <version>1</version>

    <dependencies>
        <dependency>
            <groupId>org.apache.maven</groupId>
            <artifactId>maven-artifact</artifactId>
            <version>3.5</version>
        </dependency>
    </dependencies>
</project>
```

The main section to note there is the `<dependencies>` node in the XML. You can see that the pattern we will follow when we want to add more dependencies is to add subsequent `<dependency>` nodes here.


## Mavenising Fibonacci

### The source code

You can see that this directory already includes the source code for the `Fibonacci` class and tests that we have previously created.

However, the directory structure looks quite different:

```
src
├── main
│   └── java
│       └── com
│           └── mattcalthrop
│               └── examples
│                   └── fibonacci
│                       └── Fibonacci.java
└── test
    └── java
        └── com
            └── mattcalthrop
                └── examples
                    └── fibonacci
                        └── FibonacciTest.java
```

What we are introducing here is a commonly-used _directory structure_ and _package namespacing_ convention for Java projects.

### Why namespace?

The purpose of namespacing a package is to provide a unique way of referencing it – this will ensure that our `Fibonacci` class does not clash with anyone else's implementation of a class with the same name.

In Java, it is common to namespace in a form of reverse domain name order. Hence the first line of `Fibonacci.java`:

```java
package com.mattcalthrop.examples.fibonacci;
```

Once this namespace is defined, we create a directory hierarchy that reflects the package name – which explains the directory hierarchy above.

### Creating our `pom.xml`

So we are going to create a `pom.xml` file for our project.

Here is how we will start:

```xml
<project>
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.mattcalthrop.examples.fibonacci</groupId>
    <artifactId>fibonacci</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <name>fibonacci</name>
    <description>Simple Fibonacci class with tests using Maven</description>
</project>
```

### Adding dependencies

We can now add in the required dependencies:

```xml
<project>
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.mattcalthrop.examples.fibonacci</groupId>
    <artifactId>fibonacci</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <name>fibonacci</name>
    <description>Simple Fibonacci class with tests using Maven</description>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.11</version>
            <scope>test</scope>
        </dependency>

        <dependency>
            <groupId>org.hamcrest</groupId>
            <artifactId>hamcrest-core</artifactId>
            <version>1.3</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

</project>
```

### Running maven

As in previous lessons, there is a `run-tests.bash` file that we execute:

```bash
./run-tests.bash
```

The essence of that file is the last line:

```bash
mvn clean test
```

This instructs Maven to:

- clean up anything that may have been generated during a time that Maven was previously run
- then run the tests

### Maven properties

When building a `pom.xml`, it is common practice to use Maven _properties_ to effectively define constants that are available for use in later parts of the file.

So we can define properties for the different versions of modules that we depend upon:

```xml
<project>
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.mattcalthrop.examples.fibonacci</groupId>
    <artifactId>fibonacci</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <name>fibonacci</name>
    <description>Simple Fibonacci class with tests using Maven</description>

    <properties>
        <hamcrest.version>1.3</hamcrest.version>
        <junit.version>4.11</junit.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>

        <dependency>
            <groupId>org.hamcrest</groupId>
            <artifactId>hamcrest-core</artifactId>
            <version>${hamcrest.version}</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

</project>
```

### Task: incorporate `Factorial` class and tests

Your task is to incorporate the `Factorial` class and tests from the [Introducing jUnit](../step-1-junit/README.md) lesson.

Use the same directory- and package-naming convention used for the `Fibonacci` class and tests in this directory.


## Conclusion

### What we've covered

- the basics of how [Maven](https://maven.apache.org/) works
- and how it implements dependency management
- we have set up a previous project to use Maven instead of including the external libraries in the source code

### Further reading

- https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
- https://maven.apache.org/guides/getting-started/
- https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html
