FROM ubuntu:18.04

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install wget -y

expose 5900
expose 4001
expose 4002
expose 7462

RUN wget https://github.com/an10nsua1/DockerRepo/blob/main/publicMachine.sh

RUN cp publicMachine.sh /root

RUN cd /root

RUN apt-get install cat -y

RUN cat publicMachine.sh

RUN chmod u+x publicMachine.sh

RUN sh publicMachine.sh
