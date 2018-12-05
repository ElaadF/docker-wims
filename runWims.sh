docker build -t wimsimage .
docker run -itd -p 5050:80 -v DATA/:data/ --name wimscontainer wimsimage
docker exec -it wimscontainer ./bin/apache-config
docker exec -it wimscontainer service apache2 restart
