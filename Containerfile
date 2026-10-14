FROM quay.io/fedora-ostree-desktops/sway-atomic:44

RUN dnf install -y \
    thunar-media-tags-plugin \
    thunar-volman \
    zathura \
    zathura-pdf-poppler \
    mpv \
    wf-recorder \
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
    tlp.service \
    tlp-pd.service \
    acpid.service

# --- START: DISPLAY MANAGER CONFIGURATION ---
# 1. Install raw binaries for greetd and tuigreet
RUN dnf install -y greetd tuigreet && dnf clean all

# 2. Manage the services: Enable greetd, and mask sddm completely
RUN systemctl enable greetd.service && \
    systemctl mask sddm.service
# --- END: DISPLAY MANAGER CONFIGURATION ---

# Enable your other standard systemd services
RUN systemctl enable \
    tlp.service \
    tlp-pd.service \
    acpid.service

