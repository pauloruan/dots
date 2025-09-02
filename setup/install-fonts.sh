#!/bin/bash
# Script de instalação da fonte JetBrains Mono Nerd Font.
# Sai imediatamente se um comando falhar.
set -e

# --- Variáveis ---
FONT_NAME="JetBrainsMono"
NERD_FONT_NAME="JetBrainsMonoNerdFont"
FONT_VERSION="v3.4.0"
INSTALL_DIR="$HOME/.local/share/fonts"
ZIP_FILE="$INSTALL_DIR/$FONT_NAME.zip"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$FONT_VERSION/$FONT_NAME.zip"

# --- Cores para o terminal ---
INFO='\033[1m\033[36m' # Ciano
SUCCESS='\033[1m\033[32m' # Verde
WARN='\033[1m\033[33m' # Amarelo
NC='\033[0m' # Sem cor

# --- 1. Verificação de Dependências ---
echo -e "${INFO}Verificando dependências...${NC}"
for cmd in wget unzip fc-list fc-cache; do
  if ! command -v $cmd &> /dev/null; then
    echo "Erro: Comando '$cmd' não encontrado. Por favor, instale-o e tente novamente."
    exit 1
  fi
done

# --- 2. Verificação de Fonte Existente ---
echo -e "${INFO}Verificando se a fonte já está instalada...${NC}"
if fc-list | grep -q "$NERD_FONT_NAME"; then
  echo -e "${WARN}Fonte '$NERD_FONT_NAME' já instalada. Saindo.${NC}\n"
  exit 0
fi

# --- 3. Preparação e Download ---
echo -e "${INFO}Criando diretório de fontes em '$INSTALL_DIR' (se não existir)...${NC}"
mkdir -p "$INSTALL_DIR"

echo -e "${INFO}Baixando a fonte...${NC}"
wget --show-progress -O "$ZIP_FILE" "$DOWNLOAD_URL"

# --- 4. Instalação ---
echo -e "${INFO}Descompactando fontes...${NC}"
unzip -o "$ZIP_FILE" -d "$INSTALL_DIR"

echo -e "${INFO}Removendo arquivo .zip...${NC}"
rm "$ZIP_FILE"

# --- 5. Atualização do Cache de Fontes ---
echo -e "${INFO}Atualizando o cache de fontes do sistema...${NC}"
fc-cache -f -v

echo -e "\n${SUCCESS}Instalação da fonte '$NERD_FONT_NAME' concluída com sucesso!${NC}\n"
