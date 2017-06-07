[[home]](../README.md)

# Introducing Maven


## Overview

### Objectives

- understand the basics of how [Maven](https://maven.apache.org/) works
- apply this to setting up a Java project with jUnit tests

### Prerequisites

- completion of [Introducing jUnit](../step-1-junit/README.md)
- completion of [TDD Fibonacci using jUnit](../step-2-tdd-fibonacci-junit)


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

What we are introducing here is a commonly-used convention for _namespacing_ packages in Java.

### Why namespace?

The purpose of namespacing a package is to provide a unique way of referencing it – this will ensure that our `Fibonacci` class does not clash with anyone else's implementation of a class with the same name.

In Java, it is common to namespace in a form of reverse domain name order. Hence the first line of `Fibonacci.java`:

```java
package com.mattcalthrop.examples.fibonacci;
```

Once this namespace is defined, we create a directory hierarchy that matches the package name – which explains the directory hierarchy above.

### Creating our `pom.xml`

> _TODO_

### Running maven

> _TODO_

### Execution from within Intellij

> _TODO_


## Conclusion

### What we've covered

- the basics of how [Maven](https://maven.apache.org/) works
- we have set up a previous project to use Maven instead of including the external libraries in the source code

### Further reading

- https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
- https://maven.apache.org/guides/getting-started/
- https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html
