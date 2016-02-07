CATALINA_OPTS="-server -d64 -XX:+AggressiveOpts -Djava.awt.headless=true -XX:MaxGCPauseMillis=500 -XX:MaxPermSize=${MAXPERM} -XX:PermSize=${PERM} -Xmx${MAXMEM} -Xms${MINMEM} -Xincgc -Xss${XSS}"

if $JMX ; then
  CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false  -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.port=${JMX_PORT} -Djava.rmi.server.hostname=${JMX_HOSTNAME} -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT}"
fi

if $JMX_PASS_FILE ; then
  CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote.password.file=$JMX_PASS_FILE"
fi

if $DEBUG_TOMCAT ; then
  CATALINA_OPTS="${CATALINA_OPTS} -Xdebug -Xrunjdwp:transport=dt_socket,address=${DEBUG_PORT},server=y,suspend=${DEBUG_SUSPEND}"
fi

# **** Java Monitoring and profiling ****
CATALINA_OPTS="$CATALINA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$CATALINA_BASE/monitor"

CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8"

JAVA_OPTS="$JAVA_OPTS -Dhibernate.connection.url=jdbc:postgresql://${DB_PORT_5432_TCP_ADDR:-localhost}:${DB_PORT_5432_TCP_PORT:-5432}/${DB_NAME:-xwiki} -Dhibernate.connection.username=${DB_USERNAME:-xwiki} -Dhibernate.connection.password=${DB_PASSWORD:-xwikipassword} -Dhibernate.show_sql=${SHOW_SQL:-false} -Dhibernate.connection.driver_class=org.postgresql.Driver -Dhibernate.dialect=org.hibernate.dialect.PostgreSQLDialect -Dhibernate.jdbc.use_streams_for_binary=false -Dxwiki.virtual_mode=schema"

