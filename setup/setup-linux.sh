#!/bin/bash
#
# setup-linux.sh
# Script para configurar o ambiente de desenvolvimento em um novo sistema Linux (baseado em Debian/Ubuntu).

# --- 0. Atualizar a lista de pacotes ---
echo "🚀 Iniciando a configuração do ambiente..."
echo "Atualizando a lista de pacotes do sistema (APT)..."
sudo apt update
echo ""

# --- 1. Instalar pacotes base via APT ---
echo "--- 1/4: Instalando pacotes base via APT ---"
# Adicionamos 'zsh' à lista de pacotes
PACKAGES="curl wget git neofetch gh bat tmux httpie zsh"

sudo apt install -y $PACKAGES
echo "✅ Pacotes base instalados."
echo ""

# --- 2. Configurar Zsh como shell padrão ---
echo "--- 2/4: Configurando o Zsh como shell padrão ---"
# O comando 'chsh' (change shell) altera o shell padrão do usuário atual.
# É necessário sair e entrar novamente na sessão (logout/login) para a mudança ter efeito.
chsh -s $(which zsh)
echo "✅ Zsh configurado como shell padrão."
echo "❗️ ATENÇÃO: É necessário fazer logout e login novamente para que o Zsh se torne seu shell padrão."
echo ""

# --- 3. Instalar o Starship Prompt ---
echo "--- 3/4: Instalando o Starship Prompt ---"
# Este comando baixa e executa o script de instalação oficial do Starship.
# A flag -y no final responde 'sim' para qualquer pergunta, tornando a instalação não interativa.
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "✅ Starship instalado."
echo ""

# --- 4. Instalar NVM (Node Version Manager) e Node.js ---
echo "--- 4/4: Instalando NVM e a versão LTS do Node.js ---"
# 1. Baixa e executa o script de instalação do NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 2. Carrega o NVM no ambiente do script atual para poder usá-lo imediatamente
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 3. Com o NVM carregado define a versão do Node.js LTS como padrão
echo "Instalando a versão LTS mais recente do Node.js..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*' # Define a versão LTS como padrão para novos terminais

echo "✅ NVM e Node.js LTS instalados com sucesso."
echo "❗️ ATENÇÃO: Abra um novo terminal para começar a usar o comando 'nvm'."
echo ""


# --- Conclusão ---
echo "🎉 Configuração do ambiente finalizada!"
echo "Lembre-se de fazer logout e login para aplicar a mudança do shell para Zsh."
