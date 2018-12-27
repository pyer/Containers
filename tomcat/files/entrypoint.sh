#!/bin/sh
# -----------------------------------------------------------------------------
# Control Script for the CATALINA Server
#
# Environment Variable Prerequisites
#
#   CATALINA_HOME   May point at your Catalina "build" directory.
#
#   CATALINA_BASE   (Optional) Base directory for resolving dynamic portions
#                   of a Catalina installation.  If not present, resolves to
#                   the same directory that CATALINA_HOME points to.
#
#   CATALINA_OUT    (Optional) Full path to a file where stdout and stderr
#                   will be redirected.
#                   Default is $CATALINA_BASE/logs/catalina.out
#
#   CATALINA_OPTS   (Optional) Java runtime options used when the "start",
#                   "run" or "debug" command is executed.
#                   Include here and not in JAVA_OPTS all options, that should
#                   only be used by Tomcat itself, not by the stop process,
#                   the version command etc.
#                   Examples are heap size, GC logging, JMX ports etc.
#
#   CATALINA_TMPDIR (Optional) Directory path location of temporary directory
#                   the JVM should use (java.io.tmpdir).  Defaults to
#                   $CATALINA_BASE/temp.
#
#   JAVA_HOME       Must point at your Java Development Kit installation or JRE.
#                   Required to run the with the "debug" argument.
#
#   JAVA_OPTS       (Optional) Java runtime options used when any command
#                   is executed.
#                   Include here and not in CATALINA_OPTS all options, that
#                   should be used by Tomcat and also by the stop process,
#                   the version command etc.
#                   Most options should go into CATALINA_OPTS.
#
#   JSSE_OPTS       (Optional) Java runtime options used to control the TLS
#                   implementation when JSSE is used. Default is:
#                   "-Djdk.tls.ephemeralDHKeySize=2048"
#
#   CATALINA_PID    (Optional) Path of the file which should contains the pid
#                   of the catalina startup java process, when start (fork) is
#                   used
#
#   LOGGING_CONFIG  (Optional) Override Tomcat's logging config file
#                   Example (all one line)
#                   LOGGING_CONFIG="-Djava.util.logging.config.file=$CATALINA_BASE/conf/logging.properties"
#
#   LOGGING_MANAGER (Optional) Override Tomcat's logging manager
#                   Example (all one line)
#                   LOGGING_MANAGER="-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager"
#
#   UMASK           (Optional) Override Tomcat's default UMASK of 0027
#
# -----------------------------------------------------------------------------

CATALINA_HOME=/usr/local/tomcat
CATALINA_BASE=/home/tomcat
CATALINA_OUT="$CATALINA_BASE"/logs/catalina.out
CATALINA_TMPDIR=/tmp

JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre

CLASSPATH="$CATALINA_HOME/bin/bootstrap.jar:$CATALINA_HOME/bin/tomcat-juli.jar"

# Set UMASK
umask 0027

# Set default conf
[ ! -r "$CATALINA_BASE/conf" ]    && cp -a "$CATALINA_HOME/conf"    "$CATALINA_BASE/"
[ ! -r "$CATALINA_BASE/webapps" ] && cp -a "$CATALINA_HOME/webapps" "$CATALINA_BASE/"
[ ! -r "$CATALINA_BASE/logs" ]    && mkdir "$CATALINA_BASE/logs"

JSSE_OPTS="-Djdk.tls.ephemeralDHKeySize=2048"

# Register custom URL handlers
# Do this here so custom URL handles (specifically 'war:...') can be used in the security policy
JAVA_OPTS="-Djava.protocol.handler.pkgs=org.apache.catalina.webresources"

if [ -r "$CATALINA_BASE"/conf/logging.properties ]; then
  LOGGING_CONFIG="-Djava.util.logging.config.file=$CATALINA_BASE/conf/logging.properties"
else
  # Bugzilla 45585
  LOGGING_CONFIG="-Dnop"
fi

LOGGING_MANAGER="-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager"

# Set specific environment variables
if [ -r "$CATALINA_BASE/setenv.sh" ]; then
  . "$CATALINA_BASE/setenv.sh"
fi
# ----- Execute The Requested Command -----------------------------------------
eval exec "\"$JAVA_HOME\"/bin/java" "\"$LOGGING_CONFIG\"" $LOGGING_MANAGER $JAVA_OPTS $JSSE_OPTS $CATALINA_OPTS \
      -classpath "\"$CLASSPATH\"" \
      -Dcatalina.base="\"$CATALINA_BASE\"" \
      -Dcatalina.home="\"$CATALINA_HOME\"" \
      -Djava.io.tmpdir="\"$CATALINA_TMPDIR\"" \
      org.apache.catalina.startup.Bootstrap start
