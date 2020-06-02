#!/bin/bash

case "$1" in
    start)
        docker-compose -p test -f docker-compose-idm.yaml up -d
        ;;
    stop)
        docker-compose -p test -f docker-compose-idm.yaml stop
        ;;
    clean)
        docker-compose -p test -f docker-compose-idm.yaml stop
        docker-compose -p test -f docker-compose-idm.yaml rm -f
        docker volume prune -f
        docker network prune -f
        ;;
    build)
        docker-compose -p test -f docker-compose-idm.yaml build
        ;;
    *)
        echo "run.sh start|stop|clean|build"
esac