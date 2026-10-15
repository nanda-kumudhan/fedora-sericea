FROM quay.io/fedora-ostree-desktops/sway-atomic:44

RUN dnf install -y \
    thunar-media-tags-plugin \
    thunar-volman \
    zathura \
    zathura-pdf-poppler \
    mpv \
    wf-recorder \
    wdisplays \
    NetworkManager-tui \
    7zip acpi acpid age ansible-core \
    bash-completion bat bc bind-utils direnv dmidecode \
    eza fastfetch fd-find fzf gh git git-lfs htop jq just \
    lsof man-db man-pages nano pass ripgrep smartmontools \
    strace tmux tree unzip zip vim-enhanced wget \
    tor torsocks tpm2-tools transmission-cli \
    distrobox ghostscript powertop \
    fuse fuse-libs greetd tuigreet \
    && dnf install -y --allowerasing \
    cups cups-pk-helper system-config-printer \
    ddcutil fprintd fprintd-pam libfido2 alsa-sof-firmware fwupd \
    ntfs-3g ntfsprogs \
    tlp tlp-pd tlp-rdw \
    libvirt-daemon-kvm qemu-kvm virt-manager \
    waydroid firewalld \
    tpm2-tss \
    && dnf clean all

# Configure the permanent firewall offline: no D-Bus/systemd runs during builds.
# Waydroid supplies DHCP, DNS, IPv4 forwarding and NAT on its own bridge.
RUN firewall-offline-cmd --zone=trusted --add-interface=waydroid0 && \
    firewall-offline-cmd --check-config

COPY config/waydroid/10-network.conf /etc/systemd/system/waydroid-container.service.d/10-network.conf
COPY config/waydroid/90-waydroid.conf /etc/NetworkManager/conf.d/90-waydroid.conf

RUN systemctl enable \
    firewalld.service \
    waydroid-container.service \
    fstrim.timer \
    tlp.service \
    tlp-pd.service \
    acpid.service && \
    systemctl is-enabled fstrim.timer

RUN systemctl disable sddm.service || true && \
    rm -f /etc/systemd/system/display-manager.service && \
    systemctl enable greetd.service && \
    systemctl mask sddm.service

