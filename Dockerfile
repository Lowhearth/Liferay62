FROM anapsix/alpine-java:8u181b13_jdk

RUN  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LIFERAY_HOME=/liferay
ENV LIFERAY_SHARED=/storage/liferay
ENV LIFERAY_CONFIG_DIR=/tmp/liferay/configs
ENV LIFERAY_DEPLOY_DIR=/tmp/liferay/deploy
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-7.0.62
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.5%20GA6/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip/download

WORKDIR $LIFERAY_HOME

RUN mkdir -p "$LIFERAY_HOME" \
      && wget "$LIFERAY_TOMCAT_URL" -O /tmp/liferay-portal-ce-tomcat.zip \
      && mkdir /tmp/liferay \
      && unzip /tmp/liferay-portal-ce-tomcat.zip -d /tmp/liferay \
      && mv /tmp/liferay/liferay-portal-6.2-ce-ga6/* $LIFERAY_HOME/ \
      && rm /tmp/liferay-portal-ce-tomcat.zip

RUN  wget "https://drive.google.com/drive/folders/1arXRcmFppLAPSb_rO5BWo10_joBLLjIt?usp=sharing" -O /liferay/tomcat-7.0.62/webapps/server-manager-web


EXPOSE 8080/tcp

VOLUME /storage

ENTRYPOINT ["/bin/ash"]
CMD ["/liferay/tomcat-7.0.62/bin/catalina.sh", "run"]
