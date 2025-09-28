#!/bin/bash
#
# setup-linux.sh
# Script para configurar o ambiente de desenvolvimento em sistemas Linux
# baseados em Debian/Ubuntu ou Arch Linux.

echo "🚀 Iniciando a configuração do ambiente..."

if command -v apt > /dev/null; then
    PACKAGE_MANAGER="apt"
    echo "Sistema baseado em Debian/Ubuntu detectado."
    echo "Atualizando a lista de pacotes do sistema (APT)..."
    sudo apt update -y
elif command -v pacman > /dev/null; then
    PACKAGE_MANAGER="pacman"
    echo "Sistema baseado em Arch Linux detectado."
    echo "Sincronizando os pacotes do sistema (Pacman)..."
    sudo pacman -Syu --noconfirm
else
    echo "❌ Gerenciador de pacotes não suportado (nem apt nem pacman encontrados)."
    exit 1
fi
echo ""

echo "--- 1/5: Instalando pacotes base ---"
APT_PACKAGES="curl wget git gh bat kitty btop tmux httpie zsh zsh-autosuggestions zsh-syntax-highlighting sway swaybg swayidle swaylock wofi waybar polkit-kde-agent-1 xdg-desktop-portal-wlr pavucontrol pipewire-pulse playerctl"
PACMAN_PACKAGES="curl wget git github-cli bat kitty btop tmux httpie zsh zsh-autosuggestions zsh-syntax-highlighting sway wofi waybar polkit-kde-agent xdg-desktop-portal-wlr pavucontrol pipewire-pulse playerctl"

if [ "$PACKAGE_MANAGER" = "apt" ]; then
    sudo apt install -y $APT_PACKAGES
elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
    sudo pacman -S --noconfirm $PACMAN_PACKAGES
fi
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
