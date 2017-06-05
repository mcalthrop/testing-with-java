# testing-with-java
_Learn automated testing with Java_


## Overview

This repo contains several lessons that are designed to help you learn how to write tests in Java:

1. [Introducing jUnit](./step-1-junit/)
1. [TDD Fibonacci using jUnit](./step-2-tdd-fibonacci-junit/)

> NOTE: lessons are still being written


## Instructions

The suggested use of this repository follows.

1. Browse [github.com](https://github.com/); if you don't have an account, create one, and then log in
1. Browse to [github.com/mcalthrop/testing-with-java](https://github.com/mcalthrop/testing-with-java)
1. Fork the repository into your own GitHub account (click the **Fork** button near the top right of the page)
1. Open a terminal/shell app on your local machine, and follow the instructions below

Go to your home directory:

```bash
cd
```

Create a `development` directory:

```bash
mkdir development
```

Change to that directory:

```bash
cd development
```

Clone the repository you just created, remembering to replace `your_github_username` with the username you created on GitHub:

```bash
git clone git@github.com:your_github_username/testing-with-java.git
```

Change into the directory for that repository:

```bash
cd testing-with-java
```

Create a branch called `learning` that will hold the changes you make while you are learning, and switch to it:

```bash
git checkout -b learning
```

(You could call that branch something other than `learning`, but that seems as good a name as any).

You can then proceed with following the lessons as listed above.

Remember to regularly commit the changes you make, and to push your locally-committed code back up to the `learning` branch on your GitHub account like this:

```bash
git push origin learning
```

(where `learning` is the name of the branch you created and switched to)
