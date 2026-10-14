ARG FEDORA_VERSION=44
FROM quay.io/fedora-ostree-desktops/sway-atomic:${FEDORA_VERSION}

RUN for p in power-profiles-daemon tuned-ppd; tuned; do \
      if rpm -q "$p" >/dev/null 2>&1; then dnf remove -y "$p"; fi; \
    done

RUN dnf install -y \
      thunar-media-tags-plugin thunar-volman \
      zathura zathura-pdf-poppler mpv \
      wf-recorder NetworkManager-tui \
 && dnf clean all

RUN dnf install -y \
      7zip acpi acpid age ansible-core \
      bash-completion bat bc bind-utils direnv dmidecode \
      eza fastfetch fd-find fzf gh git git-lfs htop jq just \
      lsof man-db man-pages nano pass ripgrep smartmontools \
      strace tmux tree unzip zip vim-enhanced wget \
      tor torsocks tpm2-tools transmission-cli \
      helm kustomize kubernetes1.34-client \
      distrobox ghostscript powertop \
 && dnf clean all

RUN dnf install -y \
      cups cups-pk-helper system-config-printer \
      ddcutil fprintd fprintd-pam libfido2 alsa-sof-firmware \
      ntfs-3g ntfsprogs snapper \
      tlp tlp-pd tlp-rdw \
      libvirt-daemon-kvm qemu-kvm \
      waydroid \
      tpm2-tss \
 && dnf clean all

RUN systemctl enable tlp.service tlp-pd.service acpid.service \
 && systemctl mask systemd-rfkill.service systemd-rfkill.socket

RUN mkdir -p /usr/lib/bootc/kargs.d /usr/lib/dracut/dracut.conf.d \
 && printf 'kargs = ["rd.luks.options=tpm2-device=auto"]\n' \
      > /usr/lib/bootc/kargs.d/10-tpm2-luks.toml \
 && printf 'add_dracutmodules+=" tpm2-tss "\n' \
      > /usr/lib/dracut/dracut.conf.d/50-tpm2.conf

RUN set -eux; \
    kver="$(ls /usr/lib/modules | head -n1)"; \
    dracut --no-hostonly --kver "$kver" --reproducible --zstd -v --add ostree \
      -f "/usr/lib/modules/${kver}/initramfs.img"

RUN bootc container lint
