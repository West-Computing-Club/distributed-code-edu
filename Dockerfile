FROM mcr.microsoft.com/devcontainers/base:jammy

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
RUN apt update && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends build-essential python3

ENV OPENVSCODE_SERVER_VERSION="1.79.2"

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the current directory to the /app directory in the container
RUN apt update && apt install -y nginx


COPY scripts/install.sh .
RUN sh install.sh

COPY scripts/get-ruby.sh .
RUN sh get-ruby.sh

COPY settings.json .
RUN cp settings.json openvscode-server-v${OPENVSCODE_SERVER_VERSION}-linux-x64/user-data/Machine


RUN mkdir utilities
COPY utilities ./utilities
RUN cd utilities && make
RUN mv ./utilities/openvscodeserver.app . && cd ..



# Begin Building the SERVER
COPY scripts/jekyll.sh .
RUN  sh jekyll.sh
RUN ./openvscodeserver.app create_directories


COPY scripts/start.sh .


COPY nginx.conf /etc/nginx/nginx.conf

# Copy your website files (replace 'html' with your actual folder)
COPY dce-sites /usr/share/nginx/html

# Run the SERVER
EXPOSE 443
EXPOSE 80

EXPOSE 3000

CMD ["sh", "-c", "nginx -g 'daemon off;' && sh start.sh"]
