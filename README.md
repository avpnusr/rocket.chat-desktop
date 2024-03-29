![Rocket.Chat Logos](https://rocket.chat/images/default/logo--dark.svg)

**Official Rocket.Chat client in docker container**        
**(for X11 server with GUI)**
===

Rocket.Chat provides only an amd64 architecture version, so this docker images is only for amd64 systems as well.   

Versions in the latest image
-----
- [Rocket.Chat](https://rocket.chat "Rocket.Chat Homepage") Version: 2.17.1
- [Debian Base Image](https://hub.docker.com/_/debian "Debian Docker Repo") Version: 9-slim

Start your container
-----
Use the below start sequence to get a running Rocket.Chat client displaying on your host X11 server.    
Be aware, that this way of accessing the X11 server is not the safest, you will find more secure methods online.   

```
docker run -it \
      --memory 2gb \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -e DISPLAY=$DISPLAY \ # to display on your host X11
      --device /dev/snd \ # to have sound output
      --device /dev/dri/card0 \ # to use graphics card acceleration (if needed)
      -v /dev/shm:/dev/shm \ 
      -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \ #might need a change to your system
     --name rocket.chat \
      avpnusr/rocket.chat:latest
```
   
If you close the rocket.chat window, you can restart the container any time with:     
```
docker start discord
```
