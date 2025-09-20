#!/bin/bash

# --- Início do Script ---
echo "🚀 Iniciando a configuração de links simbólicos..."

# Define o caminho absoluto para a pasta 'dots' (raiz do repositório)
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
echo "Pasta de dotfiles detectada em: $DOTFILES_DIR"
echo "------------------------------------------------"

# --- 1. Configuração do Git ---
echo "⚙️  Configurando o Git..."
ln -sf "$DOTFILES_DIR/config/git/.gitconfig" ~/.gitconfig
echo "✅ Link para .gitconfig criado com sucesso."
echo ""

# --- 2. Configuração do Zsh ---
echo "⚙️  Configurando o Zsh..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/zsh/.zshrc" ~/.zshrc
echo "✅ Link para a pasta de configuração do Zsh criado com sucesso."
echo ""

# --- 3. Configuração do Starship ---
echo "⚙️  Configurando o Starship..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/starship/starship.toml" ~/.config/starship.toml
echo "✅ Link para starship.toml criado com sucesso."
echo ""

# --- 4. Configuração do Tmux ---
echo "⚙️  Configurando o Tmux..."
mkdir -p ~/.config/tmux
ln -sf "$DOTFILES_DIR/config/tmux/tmux.conf" ~/.config/tmux/tmux.conf
echo "✅ Link para tmux.conf criado com sucesso."
echo ""

# --- 5. Configuração do Nvim ---
echo "⚙️  Configurando o Neovim (Nvim)..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/nvim" ~/.config/nvim
echo "✅ Link para a pasta de configuração do Neovim criado com sucesso."
echo ""

# --- 6. Configuração do Sway ---
echo "⚙️  Configurando o Sway..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/sway" ~/.config/sway
echo "✅ Link para a pasta de configuração do Sway criado com sucesso."
echo ""

# --- 7. Configuração do Waybar ---
echo "⚙️  Configurando o Waybar..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/waybar" ~/.config/waybar
echo "✅ Link para a pasta de configuração do Waybar criado com sucesso."
echo ""

# --- 8. Configuração do Wofi ---
echo "⚙️  Configurando o Wofi..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/wofi" ~/.config/wofi
echo "✅ Link para a pasta de configuração do Wofi criado com sucesso."
echo ""

# --- 9. Configuração do Kitty ---
echo "⚙️  Configurando o Kitty..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/kitty" ~/.config/kitty
echo "✅ Link para a pasta de configuração do Kitty criado com sucesso."
echo ""

# --- Finalização ---
echo "------------------------------------------------"
echo "🎉 Todos os links foram criados. Configuração finalizada!"
