.PHONY:	publish publish-beta default all docker-build clean

default: all

all: boot2docker.iso

boot2docker.iso: docker-build
	docker run --rm nanobox/boot2docker > boot2docker.iso

docker-build:
	docker build -t nanobox/boot2docker --no-cache=true -f Dockerfile . 

clean:
	if [ -f boot2docker.iso ]; then rm boot2docker.iso; fi

publish:
	aws s3 cp \
		boot2docker.iso \
		s3://tools.nanobox.io/boot2docker/v1/boot2docker.iso \
		--grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers \
		--region us-east-1

publish-beta:
	aws s3 cp \
		boot2docker.iso \
		s3://tools.nanobox.io/boot2docker/beta/boot2docker.iso \
		--grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers \
		--region us-east-1