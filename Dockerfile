# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    openssh-server

# Set the working directory
WORKDIR /home

# Install JupyterLab
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok

RUN service ssh start
RUN ngrok authtoken 2AdQXydT77VZUxSzBqjwtMyC4xv_3HFqfbvtMdsvQwmT9xVJK
# Expose port 8080
EXPOSE 22

# Start JupyterLab on port 8080 without authentication
CMD ["ngrok tcp 22"]
