# kube-utils

Kubectl and helm

[![CircleCI](https://circleci.com/gh/jayamorin/kube-utils.svg?style=svg)](https://circleci.com/gh/jayamorin/kube-utils)

## Overview

Kubectl and helm binaries on Ubuntu 18.04 docker image for working with Kubernetes cluster and applications. This image is useful for deploying helm charts, managing releases and general kubernetes administration.

## Usage

```bash
docker run --rm -it kube-utils bash
```

## Build

```bash
docker build -t kube-utils:latest .
```
