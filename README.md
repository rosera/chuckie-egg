# container-ch-egg
A container X11 version of Chuckie Egg 

# Chuckie Egg
Based on the classic BBC Micro game. Source Code made available by Mark Lomas
http://marklomas.net/ch-egg/native/native.htm


# Dockerfile
Standard Ubuntu 16.04 image with sounds config

# Audio Configuration
Reference asound.conf

# To Build
docker build -t ch-egg:1.0 .

# To Run
docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --hostname=$HOSTNAME -v $HOME/.Xauthority:/root/.Xauthority --device /dev/snd ch-egg:1.0 
