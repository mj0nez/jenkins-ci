# renovate: datasource=docker packageName=jenkins/jenkins versioning=docker
export JENKINS_VERSION?=2.532-jdk21
export APP_VERSION?=latest
# renovate: datasource=github-releases packageName=hashicorp/nomad
export NOMAD_VERSION?=1.10.5
# renovate: datasource=docker packageName=hashicorp/consul versioning=docker
export CONSUL_VERSION?=1.21.5
# renovate: datasource=github-tags packageName=golang/go extractVersion=^go(?<version>.*)$
export GOLANG_VERSION?=1.25.3
# renovate: datasource=github-releases packageName=golangci/golangci-lint
export GOLANGCI_LINT_VERSION?=2.5.0

# renovate: datasource=github-tags packageName=astral-sh/uv
export UV_VERSION?=0.9.9

# We use UV to install the different python versions,
# but they release them in a https://github.com/astral-sh/python-build-standalone
# which follows more or less pythons release cycle, but it's not guaranteed that
# both projects release simultaneously. For our use case this should be ok
# Before bumping you should check UV's release notes.

# renovate: datasource=docker packageName=python versioning=docker
export PYTHON_311_VERSION?=3.11.14
# renovate: datasource=docker packageName=python versioning=docker
export PYTHON_312_VERSION?=3.12.12
# renovate: datasource=docker packageName=python versioning=docker
export PYTHON_313_VERSION?=3.13.8
# renovate: datasource=docker packageName=python versioning=docker
export PYTHON_314_VERSION?=3.14.0

export COMPOSE_PROJECT_NAME:=jenkins
export COMPOSE_FILE:=docker/compose.ci.yml

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
