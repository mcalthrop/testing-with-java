[[home]](../README.md)

# Introducing Maven


## Overview

### Objectives

- understand the basics of how [Maven](https://maven.apache.org/) works
- apply this to setting up a Java project with jUnit tests

### Prerequisites

- completion of [Introducing jUnit](../step-1-junit/README.md)


## Main

```bash
mvn archetype:generate \
  -DarchetypeGroupId=de.bripkens \
  -DarchetypeArtifactId=java-quickstart \
  -DarchetypeVersion=0.2.0 \
  -DgroupId=adacollege.fibonacci \
  -DartifactId=fibonacci
```

## Conclusion

### What we've covered

- 

### Further reading

- http://junit.org/junit4/
- https://github.com/junit-team/junit4
- https://en.wikipedia.org/wiki/Hamcrest
