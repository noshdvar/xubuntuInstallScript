#!/usr/bin/env bash

set -Eeuo pipefail

echo "=== System aktualisieren ==="
sudo pacman -Syu --noconfirm


echo "=== Basis-Pakete installieren ==="
sudo pacman -S --needed --noconfirm \
    curl \
    wget \
    gnupg \
    ca-certificates \
    flatpak \
    base-devel \
    git \
    vim \
    nano \
    ffmpeg \
    vlc \
    unzip \
    unrar


echo "=== Flathub aktivieren ==="
sudo flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo


echo "=== KDE / Native Anwendungen installieren ==="
sudo pacman -S --needed --noconfirm \
    kate \
    partitionmanager \
    haruna \
    doublecmd \
    handbrake \
    handbrake-cli \
    audacity \
    ktorrent \
    btop \
    kdeconnect \
    yakuake \
    k3b \
    umbrello \
    kdenlive \
    krita \
    tellico \
    kget \
    neochat \
    tokodon \
    kasts \
    skrooge \
    kaddressbook \
    akregator \
    gwenview \
    okular \
    filelight \
    dolphin-plugins \
    plasma-disks \
    plasma-systemmonitor \
    ark \
    extraterm-bin \
    Audex \
    timeshift \
    fastfetch \
    htop \
    usbutils \
    smartmontools \
    inetutils \
    dnsutils \
    fastfetch \
    nvtop \
    bottom \
    plasma-meta \
    konsave \
    wl-clipboard \
    xdg-desktop-portal-kde \
    kwayland \
    krusader \
    qpwgraph \
    digikam \
    scribus \
    synchthing \
    ksnip


echo "=== Multimedia / Codec Support ==="
sudo pacman -S --needed --noconfirm \
    gst-libav \
    gst-plugins-good \
    gst-plugins-bad \
    gst-plugins-ugly \
    lame

echo "=== Game Performance Extras ==="
sudo pacman -S --needed --noconfirm \
    gamemode \
    mangohud \
    goverlay \
    gamescope

echo "=== LibreWolf installieren ==="

if ! command -v yay &>/dev/null; then
    echo "=== yay AUR Helper installieren ==="
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
fi

yay -S --noconfirm librewolf-bin


echo "=== Flatpak Anwendungen installieren ==="
flatpak install -y flathub \
    app.drey.EarTag \
    com.spotify.Client \
    io.anytype.anytype \
    org.kde.plasmatube \
    com.github.taiko2k.tauonmb \
    au.com.shiftyjelly.pocketcasts \
    com.github.jeromerobert.pdfarranger \
    im.riot.Riot \
    com.bitwarden.desktop \
    io.github.kdiskmark.KDiskMark \
    org.telegram.desktop \
    com.rustdesk.RustDesk


echo "=== Helium ==="
echo "Bitte manuell prüfen:"
echo "https://helium.computer"


echo "=== Cache bereinigen ==="
sudo pacman -Sc --noconfirm

echo "=== GTK Theme Override Flatpak ==="
flatpak override --filesystem=xdg-config/gtk-3.0
flatpak override --filesystem=xdg-config/gtk-4.0

echo "=== Installation abgeschlossen ==="
echo "Bitte einmal neu anmelden oder rebooten."

