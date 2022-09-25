sudo docker stop Redis
sudo docker rm Redis
sudo docker run -d -p6379:6379 --name Redis redis 
