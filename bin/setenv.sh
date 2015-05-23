CATALINA_OPTS="$CATALINA_OPTS -Xmx300m -XX:MaxPermSize=198m -Xss228k"

# **** Java Monitoring and profiling ****
CATALINA_OPTS="$CATALINA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$CATALINA_BASE/monitor"

CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.awt.headless=true"

JAVA_OPTS="$JAVA_OPTS -Dhibernate.connection.url=jdbc:postgresql://${DB_PORT_5432_TCP_ADDR}:${DB_PORT_5432_TCP_PORT}/xwiki -Dhibernate.connection.username=${DB_USERNAME} -Dhibernate.connection.password=${DB_PASSWORD}"
