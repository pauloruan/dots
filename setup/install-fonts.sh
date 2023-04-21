#!/bin/bash
# Script de instalação de fontes

# Verificando se a fonte já está instalada
if fc-list | grep -q "JetBrains Mono"; then
  echo "Fonte JetBrains Mono já instalada. Saindo."
  exit 0
fi

# Verificando se o diretório ~/.fonts existe
if [ ! -d ~/.fonts ]; then
  echo "Diretório ~/.fonts não existe. Criando..."
  mkdir ~/.fonts
fi

# Baixando fontes com HTTPS
echo "Baixando fontes com HTTPS..."
curl -o ~/.fonts/JetBrainsMono-2.304.zip https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip # JetBrains Mono font

# Descompactando fontes
echo "Descompactando fontes..."
unzip ~/.fonts/JetBrainsMono-2.304.zip -d ~/.fonts

# Removendo arquivos desnecessários
echo "Removendo arquivos desnecessários..."
rm ~/.fonts/JetBrainsMono-2.304.zip

# Atualizando cache de fontes
echo "Atualizando cache de fontes..."
fc-cache -f -v ~/.fonts

# Listando fontes instaladas
echo "Listando fontes instaladas..."
fc-list | grep JetBrains
