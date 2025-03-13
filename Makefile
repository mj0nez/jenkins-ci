# renovate: datasource=docker packageName=jenkins/jenkins versioning=docker
export JENKINS_VERSION?=2.501-jdk21

export COMPOSE_PROJECT_NAME:=jenkins
export COMPOSE_FILE:=docker/compose.ci.yml

# local build
build: CACHE=
build:
	docker compose build --pull ${CACHE}
.PHONY: build

start-%:
	docker compose up $*
.PHONY: start-%

push:
	docker compose push agent-alpine
.PHONY: push

up-%:
	docker compose up -d $*
.PHONY: up-%

# build with github actions
ci-build:
	docker compose build --pull
.PHONY: ci-build

# build with github actions
ci-push:
	docker compose push
.PHONY: ci-push

ci-images:
	docker images ls -a
.PHONY: ci-images
