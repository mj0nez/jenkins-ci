# renovate: datasource=docker packageName=jenkins/jenkins versioning=docker
export JENKINS_VERSION?=2.505-jdk21
export APP_VERSION?=latest
# renovate: datasource=github-releases packageName=hashicorp/nomad
export NOMAD_VERSION?=1.9.7
# renovate: datasource=github-tags packageName=golang/go extractVersion=^go(?<version>.*)$
export GOLANG_VERSION?=1.24.2

# renovate: datasource=github-tags packageName=astral-sh/uv
export UV_VERSION?=0.6.13

# renovate: datasource=github-tags packageName=python/cpython matchUpdateTypes=patch
export PYTHON_311_VERSION?=3.13.3
export PYTHON_312_VERSION?=3.12.9
export PYTHON_313_VERSION?=3.13.2

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
