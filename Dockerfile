FROM centos:centos7
MAINTAINER Thomas Krahn "ntbc@gmx.net"

ENV JAVA_VERSION 8
ENV JAVA_UPDATE 45
ENV JAVA_BUILD_VERSION 14
ENV JAVA_RPM_URL "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD_VERSION}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm"
ENV JAVA_RPM_FILE "/tmp/jdk.rpm"
ENV JAVA_HOME "/usr/java/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}"
ENV PATH "${PATH}:${JAVA_HOME}"

RUN yum install -y wget && \
	wget --progress=dot:giga -O ${JAVA_RPM_FILE} --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" ${JAVA_RPM_URL} && \
	rpm -Uvh ${JAVA_RPM_FILE} && \
    rm ${JAVA_RPM_FILE} && \
	alternatives --install /usr/bin/java java /usr/java/default/bin/java 20000
