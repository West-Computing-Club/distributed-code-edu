FROM mcr.microsoft.com/devcontainers/base:jammy

RUN apt update && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends build-essential python3

ENV OPENVSCODE_SERVER_VERSION="1.79.2"

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the current directory to the /app directory in the container
COPY install.sh .

RUN sh install.sh

COPY settings.json .

RUN cp settings.json openvscode-server-v${OPENVSCODE_SERVER_VERSION}-linux-x64/user-data/Machine

RUN mkdir utilities

COPY utilities ./utilities
RUN cd utilities && make


RUN mv ./utilities/openvscodeserver.app . && cd ..


# Begin Building the SERVER
RUN ./openvscodeserver.app create_directories

COPY start.sh .


# Run the SERVER
EXPOSE 3000
CMD ["./start.sh"]
