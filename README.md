# SericeaPass

My personal Fedora 45 Sway Atomic image for development and everyday use.

![SericeaPass Sway desktop showing Fedora system information in a terminal](assets/desktop.png)

GitHub Actions publishes the image as `ghcr.io/nanda-kumudhan/my-sway:latest`.

Bitwarden installs from Flathub after boot.

## Build locally

Clone the repository and build with Podman.

```sh
git clone https://github.com/nanda-kumudhan/sericeapass.git
cd sericeapass
podman build -t sericeapass -f Containerfile .
```
