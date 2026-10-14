# SericeaPass

My personal Fedora 44 Sway Atomic image for development work as a computer science student.

![SericeaPass Sway desktop showing Fedora system information in a terminal](assets/desktop.png)

Built around Sway and Wayland, with greetd and tuigreet for login. Includes my preferred packages for coding, terminal workflows, and everyday use, on top of Fedora's atomic desktop base.

Desktop tools include Thunar plugins, Zathura, mpv, wf-recorder, and wdisplays. Development and terminal tools include Git, GitHub CLI, Vim, tmux, Distrobox, Ansible, Helm, and the Kubernetes client.

Includes printing, fingerprint authentication, virtualization, and Waydroid packages, with TLP, acpid, and periodic SSD trimming enabled.

The image configuration and package list are in [`Containerfile`](Containerfile). GitHub Actions builds and publishes the image to `ghcr.io/nanda-kumudhan/my-sway:latest`.

## Build locally

With Git and Podman installed:

```sh
git clone https://github.com/nanda-kumudhan/sericeapass.git
cd sericeapass
podman build -t sericeapass -f Containerfile .
```
