
PORT:=1234
HOST:=172.17.0.1
all: image

image:
	sudo docker build -f Dockerfile.base -t base  .
	ssh-agent  sh -c './docker-ssh.sh ${PORT} sudo -E docker build --build-arg USER=${USER} --build-arg HOST=${HOST} --build-arg PORT=${PORT} -f Dockerfile.ssh --no-cache -t ssh .'

test:
	ssh-agent ./docker-ssh.sh ${PORT} sudo ./docker-build.sh  ${USER} ${HOST} ${PORT}
