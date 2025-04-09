# renovate: datasource=docker packageName=jenkins/jenkins versioning=docker
export JENKINS_VERSION?=2.505-jdk21
export APP_VERSION?=latest
# renovate: datasource=github-releases packageName=hashicorp/nomad
export NOMAD_VERSION?=1.9.7
# renovate: datasource=github-tags packageName=golang/go extractVersion=^go(?<version>.*)$
export GOLANG_VERSION?=1.2.3

export COMPOSE_PROJECT_NAME:=jenkins
export COMPOSE_FILE:=docker/docker-compose.ci.yml

# local build
build: CACHE=
build:
	docker compose build --pull ${CACHE}
.PHONY: build

build-%: CACHE=
build-%:
	docker compose build --pull ${CACHE} $*
.PHONY: build-%

start-%:
	docker compose up $*
.PHONY: start-%

push:
	docker compose push
.PHONY: push

up-%:
	docker compose up -d $*
.PHONY: up-%

config:
	docker compose config
.PHONY: config

# build with github actions
ci-build:
	docker compose build --pull
.PHONY: ci-build

# build with github actions
ci-push:
	docker compose push
.PHONY: ci-push

ci-images:
	docker image ls
.PHONY: ci-images
