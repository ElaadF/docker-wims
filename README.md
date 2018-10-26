# docker-wims
Allows to install Wims inside a docker with the full set of tools use by Wims

## I. First installation
Your system must have, at least, 3GB of free space

### 1. Install Docker
First of all you need to install Docker, please follow these instructions : 
+ [Debian](https://docs.docker.com/install/linux/docker-ce/debian/#uninstall-old-versions)
+ [OSX](https://docs.docker.com/docker-for-mac/install/)
+ [Windows](https://docs.docker.com/docker-for-windows/install/)

TL;TR for Debian :
```console
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
 ```

### 2. Clone this repository
```console
git clone https://github.com/ElaadF/docker-wims <directory path>
```   
The directory must be empty.

### 3. Build an image
Use this command to build an image from the Dockerfile in this repository. This will take several minutes.   
```console
docker build -t <image's name> <Dockerfile's directory>
```   

### 4. Run the container
If the previous step has succed, you have to run the container by creating et starting it with this following command :   
```console
docker run -itd -p <host port>:80 -v <host directory path>:<container target path> --name <container name> <image's name>
```   

```<image's name>``` should correspond to the previous name you have chosen.   
You have to choose the name of the container, otherwise a random name will be assigned.   
```<host directory path>``` is the directory's path containing all your files that you want to share with the container.   
```<container target path>``` is the directory's path in the container where your files will be available.    

At the end of this step you, you have created a container and it's running on your system. You can stop and restart by using these command :   
```console
docker container start <container's name>
docker container stop <container's name>
```   
You can create multiple container with the same command, but the port and the name must be different. If you want to share the same files you will need to put the same directory's path to the these files as the others containers.

### 5. Restart services
Run these commands :   
```console
docker exec -it <container's name> ./bin/apache-config
docker exec -it <container's name> service apache2 restart
```   

__Note__ : Always run these command **after** you start the container.

### 6. Acces from a web browser
If you have run the container on your own device, you can access to Wims by using this URL :   
**http://localhost:port/wims**   
You must specify the port you have chosen previously.

## II. Some useful commands
+ delete container :
```console
docker container rm <name>
```
The container must be stopped before deleting

+ List running container :
```console
docker container ps 
```

+ List stopped container :
```console
docker container ps -a
```

+ List image :
```console
docker images
```

+ Delete image :
```console
docker image rm <name>
```
+ Enter into a container with a bash
```console
docker exec -it <name> bash
```


