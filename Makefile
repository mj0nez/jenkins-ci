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

# build with github actions
ci-build:
	docker comose build --pull --push
.PHONY: ci-build


up-%:
	docker compose up -d $*
.PHONY: up-%
