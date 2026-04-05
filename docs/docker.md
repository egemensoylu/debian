# Docker on Debian

This repository includes `scripts/install-docker.sh` for a straightforward Docker CE install on Debian using Docker's official apt repository.

## Install

```bash
./scripts/install-docker.sh
```

## What it does

- installs apt prerequisites
- adds Docker's GPG key
- adds Docker's Debian apt repository
- installs Docker Engine, Buildx, and Compose plugin
- adds your user to the `docker` group

## After installation

Log out and back in before running Docker without `sudo`.

## Notes

- This is intended for Debian systems with Docker's official repository.
- Review the script before running it on production or shared machines.
