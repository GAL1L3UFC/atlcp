# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    openssh-server

# Set the working directory
WORKDIR /home

# Install JupyterLab
RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null \
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list \
sudo apt update \
sudo apt install playit

RUN service ssh start

# Expose port 8080
EXPOSE 22

# Start JupyterLab on port 8080 without authentication
CMD ["playit"]
