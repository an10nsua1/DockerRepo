FROM ubuntu:18.04

RUN apt update -y
RUN apt upgrade -y

#Instalando SDK de Google para descarjar los .sh
RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get install apt-transport-https ca-certificates gnupg -y

RUN apt-get install curl -y
#Importar clave publica de Google
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FEEA9169307EA071
#Instalacion propiamente dicha
RUN apt-get update && apt-get install google-cloud-sdk -y
RUN apt-get install wget -y
RUN wget https://github.com/an10nsua1/DockerRepo/blob/main/glass-cycle-309514-d0f1ab2ec8df.json

RUN gcloud auth activate-service-account --key-file=glass-cycle-309514-d0f1ab2ec8df.json

#Descarga del .sh
RUN gsutil -m cp -r gs://bucket_ibgateway_public/publicMachine.sh /root/
RUN chmod +x publicMachine.sh
RUN ./publicMachine.sh
