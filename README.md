# docker-wims
Allows to install Wims inside a docker with the full set of tools use by Wims

## 1. Install Docker
First of all you need to install Docker, please follow these instructions : 
+ [Debian](https://docs.docker.com/install/linux/docker-ce/debian/#uninstall-old-versions)
+ [OSX](https://docs.docker.com/docker-for-mac/install/)
+ [Windows](https://docs.docker.com/docker-for-windows/install/)

TL;TR for Debian :
```
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
 ```

## 2. Clone this repository
``` git clone https://github.com/ElaadF/docker-wims <directory path>```
The directory must be empty.

## 3. Build an image
Use this command to build an image from the Dockerfile in this repository. This will take several minutes.   
```console
docker build -t <image's name> <Dockerfile's directory>
```   

## 4. Run the container
If the previous step has succed, you have to run the container with this following command :   
```console
docker run -itd -p <host port>:80 -v <host directory path>:<container target path> --name <container name> <image's name>
```   

```<image's name>``` should correspond to the previous name that you have chosen.   
You have to choose the name of the container, otherwise an random name will be assigned.   
```<host directory path>``` is the directory's path containing all your files that you want to share with the container.   
```<container target path>``` is the directory's path in the container where your files will be available.    


## 5. Restart services
Run these commands :   
```
docker exec -it <container's name> ./bin/apache-config
docker exec -it <container's name> service apache2 restart
```

## 6. Acces from a web browser
If you have run the container on your own device, you can access to Wims by using this URL :   
**Http://localhost:port/wims**   
You must specify the port you have chosen previously
