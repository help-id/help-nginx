#!/usr/bin/env bash

export TAG="v1.0";
export NAME="help-nginx";
export IMAGE_NAME="$NAME:$TAG";
export CONTAINER_NAME="$NAME-$TAG"

case $1 in
  build)
    docker-compose -p "$CONTAINER_NAME" up --build --detach --force-recreate --always-recreate-deps
  ;;
  terminal)
    docker exec -it "$CONTAINER_NAME" bash
  ;;
  start)
    docker start "$CONTAINER_NAME"
  ;;
  restart)
    docker restart "$CONTAINER_NAME"
  ;;
  stop)
    docker stop "$CONTAINER_NAME"
  ;;
  rm)
    docker rm "$CONTAINER_NAME"
  ;;
  rmi)
    docker rmi "$IMAGE_NAME"
  ;;
  nginx:test)
    docker exec -it "$CONTAINER_NAME" nginx -t
  ;;
  nginx:reload)
    docker exec -it "$CONTAINER_NAME" nginx -s reload
  ;;
esac