docker build -t tz .
docker run -t -d --name tztz  tz
docker start <conrainer_ID>
docker exec -it <conrainer_ID> bash