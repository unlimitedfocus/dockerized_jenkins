FROM jenkins/jenkins:lts

USER root

# Install the latest Docker CE binaries
RUN apt-get update && \
    apt-get -y install apt-transport-https \
         ca-certificates \
         curl \
         gnupg2 \
         software-properties-common && \
         curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
         add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
         $(lsb_release -cs) \
         stable" && \
    apt-get update && \
    apt-get -qy install docker-ce python-pip groff-base
RUN pip install awscli

ENV JENKINS_HOME /var/jenkins_home
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
COPY conf/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

RUN usermod -aG docker jenkins

USER jenkins
COPY plugins/plugins.txt /var/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /var/share/jenkins/plugins.txt
