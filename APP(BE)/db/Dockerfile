FROM mariadb

ENV MYSQL_ROOT_PASSWORD user1234

WORKDIR /etc/mysql
RUN mkdir setDB
WORKDIR /etc/mysql/setDB

COPY ./setDB.sql /etc/mysql/setDB/setDB.sql

RUN echo lower_case_table_names=1 >> /etc/mysql/conf.d/docker.cnf
RUN echo default-time-zone='+9:00' >> /etc/mysql/conf.d/docker.cnf
RUN echo collation-server = utf8mb4_unicode_ci >> /etc/mysql/conf.d/docker.cnf
RUN echo collation-server = utf8mb4_0900_ai_ci >> /etc/mysql/conf.d/docker.cnf
RUN echo character-set-server = utf8mb4 >> /etc/mysql/conf.d/docker.cnf
RUN echo skip-character-set-client-handshake >> /etc/mysql/conf.d/docker.cnf

EXPOSE 3306
