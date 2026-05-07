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
    libdvdcss


echo "=== Flathub aktivieren ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


echo "=== KDE / Debian Repo Anwendungen installieren ==="
sudo apt install -y \
    kate \
    partitionmanager \
    haruna \
    doublecmd-qt \
    handbrake \
    audacity \
    rustdesk \
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
    ksnip \
    neochat

echo "=== LibreWolf Repository hinzufügen ==="
wget -O- https://deb.librewolf.net/keyring.gpg | \
    sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg


echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] https://deb.librewolf.net bookworm main" | \
    sudo tee /etc/apt/sources.list.d/librewolf.list

sudo apt update
sudo apt install -y librewolf


echo "=== Flatpak Anwendungen installieren ==="
flatpak install -y flathub \
    app.drey.EarTag \
    com.spotify.Client \
    io.anytype.anytype \
    org.ksnip.ksnip \
    org.kde.plasmatube \
    com.github.taiko2k.tauonmb \
    au.com.shiftyjelly.pocketcasts \
    com.github.jeromerobert.pdfarranger \
    im.riot.Riot \
    com.bitwarden.desktop \
    io.github.kdiskmark.KDiskMark \
    org.telegram.desktop


echo "=== Externer Terminal: ExtraTerm ==="
echo "Bitte manuell installieren:"
echo "https://extraterm.org"


echo "=== Helium ==="
echo "Bitte manuell installieren (nicht sauber paketiert für Debian/MX):"
echo "https://helium.computer"


echo "=== Audex ==="
echo "Audex ist je nach Debian/MX Repository eventuell nicht verfügbar."
echo "Versuche Installation..."
sudo apt install -y audex || true


echo "=== Installation abgeschlossen ==="
echo "Bitte einmal neu anmelden oder rebooten."
