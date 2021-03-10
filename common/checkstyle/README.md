
 1. Copy the `config` directory to your project root.
 1. Copy the following code in your `build.gradle`
    ``` groovy
    checkstyle {
      toolVersion = '8.39'
      configFile = project(':').file('config/checkstyle/checkstyle.xml')
      configProperties = [ "suppressionFile" : project(':').file('config/checkstyle/suppressions.xml')]
    }
    ```
