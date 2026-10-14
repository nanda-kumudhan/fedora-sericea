FROM quay.io/fedora-ostree-desktops/sway-atomic:45

RUN dnf install -y \
    thunar-media-tags-plugin \
    thunar-volman \
    zathura \
    zathura-pdf-poppler \
    mpv \
    wf-recorder \
    wdisplays \
    NetworkManager-tui \
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

RUN dnf install -y --allowerasing \
    cups cups-pk-helper system-config-printer \
    ddcutil fprintd fprintd-pam libfido2 alsa-sof-firmware \
    ntfs-3g ntfsprogs snapper \
    tlp tlp-pd tlp-rdw \
    libvirt-daemon-kvm qemu-kvm \
    waydroid \
    tpm2-tss \
    && dnf clean all

RUN systemctl enable \
    fstrim.timer \
    tlp.service \
    tlp-pd.service \
    acpid.service

RUN dnf install -y greetd tuigreet && dnf clean all

RUN systemctl disable sddm.service || true && \
    rm -f /etc/systemd/system/display-manager.service && \
    systemctl enable greetd.service && \
    systemctl mask sddm.service

RUN systemctl enable \
    tlp.service \
    tlp-pd.service \
    acpid.service

