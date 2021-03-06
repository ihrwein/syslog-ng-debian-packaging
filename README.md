# Syslog-ng's Debian Packaging tool

This repo contains a Docker image in which you can package syslog-ng into deb files.

## Requirements

You will need `Docker` and `fig`.

```bash
sudo pip install fig
```

## Usage

First, clone this repo to have all necessary files:

```bash
git clone https://github.com/ihrwein/syslog-ng-debian-packaging.git
```
Make sure, Docker is installed and running:
```bash
sudo docker ps
```
If it doesn't report errors, jump to the next step: build the packaging image.

```bash
cd syslog-ng-debian-packaging
sudo fig build
```

Start a container:
```bash
sudo fig run debianpackaging
```

Now, you have a bash shell in the `/packaging` directory.

You can create the deb packages with the following command:
```bash
bash -x syslog_ng.sh
```
That's all.
