#!/bin/bash

# --- Início do Script ---
echo "🚀 Iniciando a configuração de links simbólicos..."

# Define o caminho absoluto para a pasta 'dots' onde o script está
DOTFILES_DIR=$(pwd)
echo "Pasta de dotfiles detectada em: $DOTFILES_DIR"
echo "------------------------------------------------"


# --- 1. Configuração do Git ---
echo "⚙️  Configurando o Git..."
ln -sf "$DOTFILES_DIR/config/git/.gitconfig" ~/.gitconfig
echo "✅ Link para .gitconfig criado com sucesso."
echo "" 


# --- 2. Configuração do Zsh ---
echo "⚙️  Configurando o Zsh..."
ln -sf "$DOTFILES_DIR/config/zsh/.zshrc" ~/.zshrc
echo "✅ Link para .zshrc criado com sucesso."
echo ""


# --- 3. Configuração do Starship ---
echo "⚙️  Configurando o Starship..."
# Garante que a pasta ~/.config exista
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/starship/starship.toml" ~/.config/starship.toml
echo "✅ Link para starship.toml criado com sucesso."
echo ""


# --- 4. Configuração do Tmux ---
echo "⚙️  Configurando o Tmux..."
# Garante que a pasta ~/.config/tmux exista
mkdir -p ~/.config/tmux
ln -sf "$DOTFILES_DIR/config/tmux/tmux.conf" ~/.config/tmux/tmux.conf
echo "✅ Link para tmux.conf criado com sucesso."
echo ""


# --- 5. Configuração do Neovim (Nvim) ---
echo "⚙️  Configurando o Neovim (Nvim)..."
# Garante que a pasta ~/.config exista
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/nvim" ~/.config/nvim
echo "✅ Link para a pasta de configuração do Neovim criado com sucesso."
echo ""


# --- Finalização ---
echo "------------------------------------------------"
echo "🎉 Todos os links foram criados. Configuração finalizada!"
