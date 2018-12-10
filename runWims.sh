#!/bin/bash

CONTAINER_NAME = 'wimscontainer'

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
	echo "[LOG] --- wimscontainer found"
	docker container start $CONTAINER_NAME
	echo "[LOG] --- wimscontainer has been started"
else
	echo "[LOG] --- No wimscontainer found"
	echo "[LOG] --- Build docker image is starting"
	docker build -t wimsimage .
	docker run -itd -p 5050:80 -v "$(pwd)"/DATA:/DATA --name wimscontainer wimsimage
	echo "[LOG] --- Build SUCCES"
	echo "[LOG] --- wimscontainer has been started"
fi

echo "[LOG] --- restart services from wimscontainer"
docker exec -it wimscontainer ./bin/apache-config
docker exec -it wimscontainer service apache2 restart

echo "[LOG] --- wimscontainer is running !"
echo "------> http://localhost:5050/wims
