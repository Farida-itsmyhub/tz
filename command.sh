docker build -t <name_container> .
docker run --rm -it -v <path to folder with images>:/usr/src/app/dataset -v {path to folder for out}:/usr/src/app/data_out <name_container>
