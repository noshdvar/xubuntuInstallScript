#!/usr/bin/env bash

set -e

echo "=== System aktualisieren ==="
sudo apt update && sudo apt upgrade -y


echo "=== Basis-Pakete installieren ==="
sudo apt install -y \
    curl \
    wget \
    gnupg \
    ca-certificates \
    software-properties-common \
    apt-transport-https \
    flatpak \
    ttf-mscorefonts-installer \
    libdvdcss \
    ark \
    bzip2 \
    cpio \
    hashdeep \
    p7zip \
    unrar \
    rar \
    unzip \
    zip \
    fonts-jetbrains-mono

echo "=== Flathub aktivieren ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "=== KDE / Debian Repo Anwendungen installieren ==="
sudo apt install -y \
    kde-cli-tools \
    kio-extras \
    kate \
    partitionmanager \
    haruna \
    handbrake \
    audacity \
    rustdesk \
    ktorrent \
    fastfetch \
    yakuake \
    k3b \
    krita \
    tellico \
    kget \
    tokodon \
    kasts \
    skrooge \
    akregator \
    minder \
    krusader \
    teamviewer \
    audex

echo "=== Microsoft Edge Repository hinzufügen ==="
# Download the Microsoft Edge repository key
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# Add the Microsoft Edge repository
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
# Update the package list
sudo apt update
# Install Microsoft Edge
sudo apt install microsoft-edge-stable

echo "=== LibreWolf Repository hinzufügen ==="
sudo apt update
sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo extrepo update librewolf
sudo apt update
sudo apt install -y librewolf

echo "=== Flatpak Anwendungen installieren ==="
flatpak install -y flathub \
    io.github.mrvladus.List
    com.spotify.Client \
    io.anytype.anytype \
    org.ksnip.ksnip \
    org.kde.plasmatube \
    com.github.taiko2k.tauonmb \
    au.com.shiftyjelly.pocketcasts \
    com.github.jeromerobert.pdfarranger \
    im.riot.Riot \
    io.github.kdiskmark.KDiskMark \
    org.telegram.desktop

echo "=== Helium ==="
echo "Bitte manuell installieren (nicht sauber paketiert für Debian/MX):"
echo "https://helium.computer"

echo "=== Installation abgeschlossen ==="
echo "Bitte einmal neu anmelden oder rebooten."
