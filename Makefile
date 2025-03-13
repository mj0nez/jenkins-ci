# renovate: datasource=docker packageName=jenkins/jenkins versioning=docker
export JENKINS_VERSION?=2.501-jdk21
export APP_VERSION?=latest
# renovate-gh: datasource=github-releases packageName=hashicorp/nomad
export NOMAD_VERSION?=1.9.5

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

# build with github actions
ci-build:
	docker compose build --pull
.PHONY: ci-build

# build with github actions
ci-push:
	docker compose push
.PHONY: ci-push

ci-images:
	docker images ls
.PHONY: ci-images
