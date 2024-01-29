# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    wget

# Set the working directory
WORKDIR /home

# install ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
RUN tar xf ngrok-v3-stable-linux-amd64.tgz
RUN service ssh start
RUN ./ngrok authtoken 2AdQXydT77VZUxSzBqjwtMyC4xv_3HFqfbvtMdsvQwmT9xVJK
RUN ./ngrok tcp 22 > /dev/null 2>&1
# Expose port 8080
EXPOSE 22

# Start JupyterLab on port 8080 without authentication
CMD ["ls"]
