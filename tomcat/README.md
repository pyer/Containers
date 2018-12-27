# docker-tomcat
Docker image Alpine JRE8 Tomcat 8.5

## Usage

**Build :** `docker build --rm -t pyer/tomcat .`
**Run   :** `docker run -d -p 8080:8080 -v /opt/base:/home/tomcat --name tomcat pyer/tomcat`
**Shell :** `docker exec -ti tomcat ash -l`

'/opt/base' drectory is Tomcat CATALINA_BASE
Application war files are copied in /opt/base/webapps

### First run

If base directory is empty, first run copies default Tomcat application to base.

### Deploy a new application

Copy war files in base/webapps

Apply configuration changes in base/conf

Example:

With base/webapps/app.war URL is [http://localhost:8080/app]

### Environment variables

base/setenv.sh is optional and allows to set CLASSPATH and JAVA_OPTS variables

Example:

> # CLASSPATH

> for anyfile in $(find $CATALINA_BASE/lib/ -type f); do

>   CLASSPATH=$CLASSPATH:$anyfile

> done

> # Encoding

> JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"

> # JMX 

> JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=6001"

> JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"

> JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"


