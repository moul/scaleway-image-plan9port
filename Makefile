DOCKER_NAMESPACE =	moul/armhf-
NAME =			ocs-app-plan9port
VERSION =		vivid
VERSION_ALIASES =	15.04 latest
TITLE =			Plan9port
DESCRIPTION =		Plan9port
SOURCE_URL =		https://github.com/online-labs/image-app-plan9port


## Image tools  (https://github.com/online-labs/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/image-tools | bash
-include docker-rules.mk
## Here you can add custom commands and overrides
