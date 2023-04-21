#!/bin/bash
# Script de instalação de pacotes

# Pacotes a serem instalados
PACKAGES="curl wget git neofetch gh bat tmux httpie

echo "Instalando pacotes..."
sudo apt-get install -y $PACKAGES

echo "Instalação concluída! 🤙"
