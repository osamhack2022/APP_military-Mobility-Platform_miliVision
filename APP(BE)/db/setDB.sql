CREATE DATABASE milivision;

create user 'root'@'%' identified by 'user1234';
grant all privileges on milivision.* to 'root'@'%' identified by 'user1234';
flush privileges;
