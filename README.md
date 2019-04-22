# container-ch-egg

![](images/chuckie-egg.png)

A container based version of the classic BBC Micro game Chuckie Egg, accessed using the X11 protocol 

# Chuckie Egg
Source Code made available by [Mark Lomas](http://marklomas.net/ch-egg/native/native.htm)


# Dockerfile
Standard Ubuntu 16.04 image with sound config

# Audio Configuration
Reference asound.conf

# To Build
docker build -t ch-egg:1.0 .

# To Run
docker run --rm -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --hostname=$HOSTNAME -v $HOME/.Xauthority:/root/.Xauthority --device /dev/snd ch-egg:1.0 
