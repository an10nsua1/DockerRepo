FROM ubuntu:18.04

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install wget -y

expose 5900
expose 4001
expose 4002
expose 7462

RUN wget https://raw.githubusercontent.com/an10nsua1/DockerRepo/main/publicMachine.sh

RUN cp publicMachine.sh /root

RUN cd /root


RUN cat publicMachine.sh

RUN chmod u+x publicMachine.sh

RUN sudo docker login

RUN sh publicMachine.sh
