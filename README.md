# GitHubAction Django_CI_CD




master push or pr ->

GitHubAction -> appleboy로 인스턴스 접속후 작성해준 deploy 스크립트 실행


---deploy.sh---

#!/bin/bash

echo "CI CD TEST"         

sudo docker-compose down                       <- 도커 컴포트 내림

sudo docker rmi $(sudo docker images -q)       <- 도커 이미지 전체 삭제

sudo docker build -t django-sim:1.1.1 .        <- Dockerfile build

sudo docker-compose up -d                      <- 도커 컴포즈 올림
