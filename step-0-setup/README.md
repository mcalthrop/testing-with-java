[[home]](../README.md)

# Setup


## Overview

### Prerequisites

- an understanding of how to use git and GitHub
- a basic understanding of the Java programming language
- a system that runs some flavour of Unix or Linux
- software installed:
  - git 1.x
  - java 8
  - maven 3.x

**Note for Windows 10 users:** please see [github.com/mcalthrop/ubuntu-windows-setup](https://github.com/mcalthrop/ubuntu-windows-setup) for information about how to set up Ubuntu on your system.

### Basic GitHub setup

1. Browse to [github.com](https://github.com/); if you don't have an account, create one, and then log in
1. Browse to [github.com/mcalthrop/testing-with-java](https://github.com/mcalthrop/testing-with-java)
1. Fork the repository into your own GitHub account (click the **Fork** button near the top right of the page)
1. Open a terminal/shell app on your local machine, and follow the instructions below

### Set git user name and email

Configure your name and email address for commits (be sure to use the email address you have registered with GitHub):

```bash
git config --global user.name "Your Name"
```

```bash
git config --global user.email "your.name@example.com"
```

### Create directory for development

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

### Clone the forked repository

Clone the repository you just created, remembering to replace `your_github_username` with the username you created on GitHub:

```bash
git clone git@github.com:your_github_username/testing-with-java.git
```

Change into the directory for that repository:

```bash
cd testing-with-java
```

### Use a git branch for your work

Create a git branch called `learning` that will hold the changes you make while you are learning, and switch to it:

```bash
git checkout -b learning
```

(You could call that branch something other than `learning`, but that seems as good a name as any).

### Start the lessons

You can then proceed with following the lessons as listed above.

Remember to regularly commit the changes you make, and to push your locally-committed code back up to the `learning` branch on your GitHub account like this:

```bash
git push origin learning
```

(where `learning` is the name of the branch you created and switched to)
