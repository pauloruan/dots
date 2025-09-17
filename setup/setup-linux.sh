#!/bin/bash
#
# setup-linux.sh
# Script para configurar o ambiente de desenvolvimento em um novo sistema Linux baseado em Debian/Ubuntu.

# --- 0. Atualizar a lista de pacotes ---
echo "🚀 Iniciando a configuração do ambiente..."
echo "Atualizando a lista de pacotes do sistema (APT)..."
sudo apt update -y
echo ""

# --- 1. Instalar pacotes base via APT ---
echo "--- 1/5: Instalando pacotes base via APT ---"
PACKAGES="curl wget git gh bat tmux httpie warp-terminal zsh zsh-autosuggestions zsh-syntax-highlighting sway swaybg swayidle swaylock wofi waybar polkit-kde-agent-1 xdg-desktop-portal-wlr pavucontrol pulseaudio playerctl"

sudo apt install -y $PACKAGES
echo "✅ Pacotes base instalados."
echo ""

# --- 2. Configurar Zsh como shell padrão ---
echo "--- 2/5: Configurando o Zsh como shell padrão ---"
chsh -s $(which zsh)
echo "✅ Zsh configurado como shell padrão."
echo "❗️ ATENÇÃO: É necessário fazer logout e login novamente para que o Zsh se torne seu shell padrão."
echo ""

# --- 3. Instalar o Oh My Zsh ---
echo "--- 3/5: Instalando o Oh My Zsh ---"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "✅ Oh My Zsh instalado."
echo ""

# --- 4. Instalar o Starship Prompt ---
echo "--- 4/5: Instalando o Starship Prompt ---"
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "✅ Starship instalado."
echo ""

# --- 5. Instalar NVM (Node Version Manager) e Node.js ---
echo "--- 5/5: Instalando NVM e a versão LTS do Node.js ---"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Instalando a versão LTS mais recente do Node.js..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "✅ NVM e Node.js LTS instalados com sucesso."
echo "❗️ ATENÇÃO: Abra um novo terminal para começar a usar o comando 'nvm'."
echo ""

# --- Conclusão ---
echo "🎉 Configuração do ambiente finalizada!"
echo "Lembre-se de fazer logout e login para aplicar a mudança do shell para Zsh."
