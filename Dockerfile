FROM debian:bullseye

RUN apt update && apt upgrade && apt install curl unzip -y
RUN curl -o /tmp/nhscontrol.zip https://www.nhs.com.br/wp-content/uploads/2020/08/nhsups_3.1.36_x86_64_eGLIBC_2.11.zip
RUN unzip /tmp/nhscontrol.zip -d /tmp/nhscontrol && cd /tmp/nhscontrol/nhsups_3.1.36_x86_64_eGLIBC_2.11 && chmod +x install.sh && ./install.sh

RUN cd /usr/local/nhs && chmod +x nhsupsserver
EXPOSE 2001

WORKDIR /usr/local/nhs/
ENTRYPOINT ./nhsupsserver
