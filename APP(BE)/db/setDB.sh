#같은 폴더에 있는 Dockerfile로 mariadb라는 이미지 빌드 후에 실행하면 됨
CONTAINER_NAME=MariaDB
SET_SQL_PATH=/etc/mysql/setDB/setDB.sql
SET_SQL_DELAY=10
DB_ROOT_UID=root
DB_ROOT_PASSWORD=user1234


echo ""
echo ""
echo "[RUN] 1. Remove Container '$CONTAINER_NAME' "
sudo docker stop $CONTAINER_NAME
sudo docker rm $CONTAINER_NAME
sudo docker rmi $CONTAINER_NAME
echo ""
echo "[RUN] 2. Run Container"
sudo docker run -d -p3306:3306 -v /home/sehwan505/data:/var/lib/mysql --name $CONTAINER_NAME mariadb
echo ""
echo "[RUN] 3. Set DB"
echo "Wait for 5 second"
sleep $SET_SQL_DELAY s
sudo docker exec $CONTAINER_NAME sh -c "mysql -u$DB_ROOT_UID -p$DB_ROOT_PASSWORD < $SET_SQL_PATH"
echo ""
echo "[RUN COMPLETE]"
echo ""
echo ""
