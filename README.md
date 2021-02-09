# Docker images for bomutils

This is a Docker image with compiled versions of https://github.com/hogliux/bomutils, useful for creating macOS installation packages on non-macOS platforms.

See http://bomutils.dyndns.org/tutorial.html for information on building packages.

## Security

The Dockerfile verifies the hash of the downloaded source code, and the resulting image runs as a non-root user.
