# davmail service
#
# This Dockerfile will build a small davmail docker image based on Alpine Linux

FROM alpine
MAINTAINER widder <widder512@yahoo.de>

RUN apk add --update bash openjdk7-jre-base ca-certificates && \
  find /usr/share/ca-certificates/mozilla/ -name *.crt -exec keytool -import -trustcacerts \
  -keystore /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts -storepass changeit -noprompt \
  -file {} -alias {} \; && \
  keytool -list -keystore /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts --storepass changeit


# Expose reference to JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk

# Adjust PATH to include all JDK related executables
ENV PATH $JAVA_HOME/bin:$PATH

RUN apk add --update  wget
RUN adduser -h /usr/local/davmail -s /sbin/nologin -D -S -u 5555 davmail
RUN           wget -O /tmp/dav.tgz http://downloads.sourceforge.net/project/davmail/davmail/4.6.1/davmail-linux-x86_64-4.6.1-2343.tgz
RUN cd tmp && tar -xzf /tmp/dav.tgz && rm *.tgz && cd /tmp/dav* && mkdir -p /usr/local/davmail && mv * /usr/local/davmail/.
RUN ls -la /tmp
RUN ls -la /usr/local/davmail


#VOLUME        /etc/davmail
EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail
CMD           ["/etc/davmail/davmail.properties"]
ENTRYPOINT    ["/usr/local/davmail/davmail.sh"]
