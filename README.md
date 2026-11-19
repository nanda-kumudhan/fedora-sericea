# SericeaPass

My personal Fedora 45 Sway Atomic image for development and everyday use.

GitHub Actions publishes the image as `ghcr.io/nanda-kumudhan/my-sway:latest`.

## Build locally

Clone the repository and build with Podman.

```sh
git clone https://github.com/nanda-kumudhan/sericeapass.git
cd sericeapass
podman build -t sericeapass -f Containerfile .
```
