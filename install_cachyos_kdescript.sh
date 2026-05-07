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
    unrar \
    pamac-qt

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
    ksnip \
    bitwarden
 

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

echo "=== AUR Pakete installieren ==="
yay -S --noconfirm \
    librewolf-bin \
    spotify \
    anytype-bin \
    plasmatube \
    tauon-music-box \
    pdfarranger \
    element-desktop \
    bitwarden-bin \
    rustdesk \
    kdiskmark \
    rustdesk-bin \
    telegram-desktop

echo "=== Flatpak Anwendungen installieren ==="
flatpak install -y flathub \
    io.anytype.anytype \
    au.com.shiftyjelly.pocketcasts  

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

