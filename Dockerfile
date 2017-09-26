FROM frolvlad/alpine-glibc:alpine-3.6

ENV JAVA_VERSION=8 \
    JAVA_UPDATE=144 \
    JAVA_BUILD=01 \
    JAVA_HOME=/usr/lib/jvm/current-java

RUN apk update && apk upgrade && apk add wget ca-certificates


RUN cd /tmp \
    && wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
      "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/090f390dda5b47b9b721c7dfaa008135/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" \
      -P /tmp \
    && tar xzf "/tmp/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" -C /tmp \
    && mkdir -p /usr/lib/jvm && mv "/tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" \
    && ln -s "java-${JAVA_VERSION}-oracle" $JAVA_HOME \
    && ln -s "$JAVA_HOME/bin/"* "/usr/bin/" \
    && rm -rf $JAVA_HOME/*.txt \
    && rm -rf $JAVA_HOME/*.html \
    && rm -rf "$JAVA_HOME/"*src.zip && \
    rm -rf "$JAVA_HOME/lib/missioncontrol" \
           "$JAVA_HOME/lib/visualvm" \
           "$JAVA_HOME/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/plugin.jar" \
           "$JAVA_HOME/jre/lib/ext/jfxrt.jar" \
           "$JAVA_HOME/jre/bin/javaws" \
           "$JAVA_HOME/jre/lib/javaws.jar" \
           "$JAVA_HOME/jre/lib/desktop" \
           "$JAVA_HOME/jre/plugin" \
           "$JAVA_HOME/jre/lib/"deploy* \
           "$JAVA_HOME/jre/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/"*jfx* \
           "$JAVA_HOME/jre/lib/amd64/libdecora_sse.so" \
           "$JAVA_HOME/jre/lib/amd64/"libprism_*.so \
           "$JAVA_HOME/jre/lib/amd64/libfxplugins.so" \
           "$JAVA_HOME/jre/lib/amd64/libglass.so" \
           "$JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so" \
           "$JAVA_HOME/jre/lib/amd64/"libjavafx*.so \
           "$JAVA_HOME/jre/lib/amd64/"libjfx*.so \
    && rm -rf "$JAVA_HOME/jre/bin/jjs" \
           "$JAVA_HOME/jre/bin/keytool" \
           "$JAVA_HOME/jre/bin/orbd" \
           "$JAVA_HOME/jre/bin/pack200" \
           "$JAVA_HOME/jre/bin/policytool" \
           "$JAVA_HOME/jre/bin/rmid" \
           "$JAVA_HOME/jre/bin/rmiregistry" \
           "$JAVA_HOME/jre/bin/servertool" \
           "$JAVA_HOME/jre/bin/tnameserv" \
           "$JAVA_HOME/jre/bin/unpack200" \
           "$JAVA_HOME/jre/lib/ext/nashorn.jar" \
           "$JAVA_HOME/jre/lib/jfr.jar" \
           "$JAVA_HOME/jre/lib/jfr" \
           "$JAVA_HOME/jre/lib/oblique-fonts" \
    && apk del wget ca-certificates \
    && rm /tmp/*
