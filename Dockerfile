# docker run --rm -e DISPLAY=$DISPLAY \
#  -v /tmp/.X11-unix:/tmp/.X11-unix \
#  --hostname=$HOSTNAME \
#  -v $HOME/.Xauthority:/root/.Xauthority \
#  --device /dev/snd ch-egg:1.0

FROM ubuntu:16.04 
LABEL maintainer "Rich Rose <askrichardrose@gmail.com>"

# Add standard SDL libraries
RUN apt-get update && apt-get install -y libsdl1.2debian alsa-base alsa-utils

# Add chuckie user
RUN groupadd -r chuckie && useradd -r -g chuckie -G audio,video chuckie \
    && mkdir -p /home/chuckie/Downloads && chown -R chuckie:chuckie /home/chuckie

ENV HOME /home/chuckie

# Add a working directory
WORKDIR /home/chuckie

# Copy the app and sound config to the image
COPY app .
COPY asound.conf /etc/asound.conf

# Set the user
USER chuckie

# Run the command
CMD "./ch-egg"
