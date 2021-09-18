FROM alpine:latest
COPY webapp.war /usr/ROOT.war
CMD ["sh", "-c", "tail -f /dev/null"]
