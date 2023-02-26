FROM ubuntu:18.04

# Install pacakges
RUN apt-get update

# Install ssh
#RUN apt-get -y install openssh-client

# Confugure ssh client
#COPY id_rsa /root/.ssh/id_rsa
#RUN chmod 600 /root/.ssh/id_rsa

# Install gradle 4.2.1
#RUN mkdir /opt/gradle && \
#    wget https://downloads.gradle.org/distributions/gradle-4.2.1-bin.zip && \
#    unzip -d /opt/gradle gradle-4.2.1-bin.zip && \
#    rm gradle-4.2.1-bin.zip
#ENV PATH=$PATH:/opt/gradle/gradle-4.2.1/bin

#Install maven
RUN apt install maven -y
# Install docker 18.03
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt-get update
RUN apt-get -y install docker-ce

RUN useradd -m -d /var/lib/jenkins jenkins \
    usermod -aG docker jenkins
#RUN mkdir -p /.docker/buildx/instances \
#    mkdir -p /.docker/buildx/defaults \
#    mkdir -p /.docker/buildx/activity
#VOLUME /var/run/docker.sock:/var/run/docker.sock

# Clear cache
RUN apt-get clean