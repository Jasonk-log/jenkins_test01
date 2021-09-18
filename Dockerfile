FROM alpine:latest
COPY webapp.war /usr/ROOT.war
CMD ["sh", "-c", "test -f /dev/null"]
