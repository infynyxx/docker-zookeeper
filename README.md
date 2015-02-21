docker-zookeeper
================

A docker image for Zookeeper 3.4.6 using Zulu OpenJDK 8.x.

* Use Zulu OpenJDK 8 instead of default JRE / JDK
* Use [G1 GC](http://www.oracle.com/technetwork/java/javase/tech/g1-intro-jsp-135488.html) mode along with `-Xloggc`
* configurable data and log directory
* configurable ZK port
* configurable JVM heap memory
