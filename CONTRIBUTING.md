# Contributing

Thanks for taking a look.

This repository is intentionally small and practical. If you want to contribute, keep changes readable and easy to audit.

## Guidelines

- prefer plain shell over heavy tooling
- keep package lists focused and commented when needed
- avoid machine-specific secrets or private paths
- update documentation when behavior changes
- keep scripts Debian-first unless stated otherwise

## Before opening a pull request

- run `bash -n` on modified shell scripts if possible
- explain why a package or config change is useful
- mention whether a change is desktop-only, laptop-only, or broadly useful
