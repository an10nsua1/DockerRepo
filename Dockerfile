FROM ubuntu:18.04

RUN apt update -y
RUN apt upgrade -y

#Instalando SDK de Google para descarjar los .sh
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN sudo apt-get install apt-transport-https ca-certificates gnupg
#Importar clave publica de Google
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
#Instalacion propiamente dicha
RUN sudo apt-get update && sudo apt-get install google-cloud-sdk

RUN gcloud init

#Descarga del .sh
RUN gsutil -m cp -r gs://bucket_ibgateway_public/publicMachine.sh /root/
RUN chmod +x publicMachine.sh
RUN ./publicMachine.sh