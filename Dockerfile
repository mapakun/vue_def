# Docker 이미지를 구성하기 위해 베이스 이미지로 Node.js의 최신 버전을 사용
FROM node:latest

# 컨테이너 내부에서 /app 디렉토리를 작업 디렉토리로 설정
WORKDIR /app

# package.json 및 package-lock.json(있는 경우) 파일을 현재 디렉토리(작업 디렉토리 /app)로 복사 및 설치
COPY package*.json ./
RUN npm install

# Dockerfile이 위치한 디렉토리의 모든 파일과 디렉토리를 컨테이너의 작업 디렉토리(/app)로 복사
COPY . .

# 프로젝트를 빌드하기 위해 package.json에 정의된 build 스크립트를 실행
RUN npm run build

# http 서버를 전역으로 설치 후 빌드된 정적 파일을 호스팅
RUN npm install -g http-server

# 컨테이너의 8080 포트를 노출
EXPOSE 8500

CMD [ "http-server", "dist", "-p 8500" ]