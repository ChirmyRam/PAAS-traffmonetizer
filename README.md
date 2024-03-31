# tm
# username + secret
docker logout
docker login
docker build -t chirmyram/tm .
docker push chirmyram/tm
docker rmi chirmyram/tm
