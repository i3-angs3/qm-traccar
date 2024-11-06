IMAGE_VERSION=6.5.1
IMAGE_NAME=qm-traccar
DOCKER_USER=libraian
DOCKER_REPO=qm-traccar

docker container ps
docker image ls
printf "\nRemoving existing $IMAGE_NAME image...\n"
docker rmi $(docker images -q $DOCKER_USER/$IMAGE_NAME) -f
printf "\nRemoving dangling images...\n"
docker image prune -f
printf "\nRemoving caches...\n"
docker builder prune -f
printf "\nBuilding $IMAGE_NAME image...\n"
docker build -t $DOCKER_USER/$IMAGE_NAME:$IMAGE_VERSION -t $DOCKER_USER/$IMAGE_NAME:$IMAGE_VERSION-alpine -t $DOCKER_USER/$IMAGE_NAME:latest .
docker push $DOCKER_USER/$IMAGE_NAME --all-tags
read -p "Press any key to continue..." -n1 -s