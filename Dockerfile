FROM  ubuntu:22.04



# Begin Building the SERVER
RUN ./compile.sh && ./create_directories.out


# Run the SERVER

CMD ./start.sh

