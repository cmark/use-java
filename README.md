# use-java

Windows 10 PowerShell Scripts to easily switch between Java 8 and 11 (via https://github.com/shyiko/jabba) and save time :coffee:

# Install

1. Install `jabba` cli tool from https://github.com/shyiko/jabba
2. Run `use-java-8.ps1` or `use-java-11.ps1` script depending on your use case

The script will install and use a hardcoded version of Java 8/Java 11 respectively via `jabba` and will also change the `JAVA_HOME` and `PATH` environment variables so tools that depend on those variables will work properly. :sunglasses: