FROM alpine:latest
COPY webapp.war /usr/local/tomcat/webapps/ROOT.war
CMD ["sh", "-c", "tail -f /dev/null"]
