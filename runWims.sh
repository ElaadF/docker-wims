# si il existe un container qui porte le nom <name>
#		docker container start <container's name>
#sinon
docker build -t wimsimage .
docker run -itd -p 5050:80 -v "$(pwd)"/DATA:/DATA --name wimscontainer wimsimage
docker exec -it wimscontainer ./bin/apache-config
docker exec -it wimscontainer service apache2 restart