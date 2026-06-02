#!/usr/bin/env bash

set -e

echo "===================================="
echo " Fedora Asahi Setup"
echo "===================================="

echo
echo "=== System aktualisieren ==="
sudo dnf upgrade -y

echo
echo "=== RPM Fusion aktivieren ==="
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo
echo "=== Basis-Pakete installieren ==="
sudo dnf install -y curl wget gnupg2 ca-certificates flatpak ark bzip2 cpio hashdeep p7zip unrar zip unzip jetbrains-mono-fonts liberation-fonts google-noto-sans-fonts google-noto-serif-fonts fastfetch htop filelight kcalc dolphin-plugins ffmpegthumbnailer

echo
echo "=== Multimedia-Unterstützung ==="
sudo dnf install -y libdvdcss 

echo
echo "=== KDE-Anwendungen installieren ==="
sudo dnf install -y kde-cli-tools kio-extras kate partitionmanager haruna handbrake audacity ktorrent btop kdeconnectd yakuake k3b krita tokodon kasts skrooge krusader

echo
echo "=== Flathub aktivieren ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo
echo "=== Flatpak-Anwendungen installieren ==="
flatpak install -y flathub com.spotify.Client io.anytype.anytype org.kde.plasmatube com.github.taiko2k.tauonmb au.com.shiftyjelly.pocketcasts com.github.jeromerobert.pdfarranger im.riot.Riot com.bitwarden.desktop org.telegram.desktop 

echo
echo "=== LibreWolf Repository hinzufügen ==="
sudo dnf config-manager addrepo --from-repofile https://repo.librewolf.net/librewolf.repo

echo
echo "=== LibreWolf installieren ==="
sudo dnf install -y librewolf


echo
echo "===================================="
echo " Installation abgeschlossen"
echo "===================================="
echo
echo "Ein Neustart wird empfohlen."
