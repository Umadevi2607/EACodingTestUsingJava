#  API Automation Tests

The API Test Automation Framework is developed in Karate. The project uses Maven, Cucumber and Karate.

## Overview
------
Karate is built on top of Cucumber, a BDD testing framework. Karate and Cucumber use same 'Descriptive Language' called Gherkin to describe the tested features. The simple but powerful syntax of Gherkin allow us to write complex tests while keeping it understandable to even non-technical users.

## Getting Started
------
### Components of Karate Framework
Below are the tools and components of Karate framework.

| Tools/Components        | Details           |
| ------------- |-------------|   
|Java |   Karate requires Java 8 , it works fine on OpenJDK so any Java version from 8-12 is supported|
|Maven|	Build and project management|
|POM.XML|	A Project Object Model or POM is the fundamental unit of Maven. It is an XML file that contains information about the project, dependencies and configurations used by Maven to build the project|
|IntelliJ|	Integrated development environment to create, debug and run the tests|
|Gatling |  Gatling (and Scala) will be used for defining the load-model it re-uses Karate tests as performance tests executed by Gatling |


**Karate Dependencies** <br/>
For Karate we only need the `karate-core` artifact but inorder to have a better IDE experience we have also used JUnit variant as below.

```xml
<dependency>
    <groupId>com.intuit.karate</groupId>
    <artifactId>karate-core</artifactId>
    <version>1.1.0</version>
</dependency>
```

```xml
<dependency>
    <groupId>com.intuit.karate</groupId>
    <artifactId>karate-junit5</artifactId>
    <version>1.2.0</version>
    <scope>test</scope>
</dependency>
```

## Build and Test
------
Below are the commands to run the project.
### Running Functional Tests
- *To run test cases on all APIs:* <br/>
```
mvn clean test -Dtest=BaseRunner
```

- *To run test cases on Specific API:* <br/>
```
mvn clean test -Dtest=TestRunner
```

## Logging
------
Default logging is set to `ERROR` in `logback-test.xml` file. There is a variable defined in Pipeline and value selected in that will override the default log level. This value can also be passed from command line when running the project from local machine.

Default log level:
```xml
<!--    karate log level must be one of TRACE, DEBUG, INFO, WARN or ERROR. Default is set to DEBUG  -->
    <logger name="com.intuit" level="${logLevel:-ERROR}"/>
```

Command to override the default log level:
```
mvn clean test -Dtest=BaseRunner -Dkarate.env=ST -DlogLevel="DEBUG"
```

## Test Reports
------
The project will generate "Karate HTML Report" as well as "Cucumber HTML Report" in target folder.

**Karate HTML Report** <br/>
The karate HTML report gets generated automatically. The report gets generated in output directory `target/karate-reports` by default and this report is useful for visually verifying or troubleshooting the effectiveness of the test run. <br/>

![Karate HTML Report](/src/test/java/util/images/karate-report.jpg)

**Cucumber HTML Report** <br/>
By using parallel runner class `BaseRunner` all the features under classpath would run in parallel and cucumber HTML report would be generated under `target/cucumber-html-reports`. Below is the sample cucumber HTML Report. <br/>

![Cucumber HTML Report](/src/test/java/util/images/cucumber-html-report.jpg)

**Azure Pipelines Cucumber Reporter** <br/>
We have used Azure DevOps extension that provides a task for publishing Cucumber report in a HTML format and embeds it into a Build and Release pages. This extension reads Cucumber run report saved in JSON format and then publish the results. This provides immediate preview of the test results within Azure Pipelines. <br/>

![Cucumber HTML Report](/src/test/java/util/images/cucumber-publisher.jpg)
