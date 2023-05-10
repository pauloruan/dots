#!/bin/bash
# Script de instalação de fontes

# Verificando se a fonte já está instalada
if fc-list | grep -q "JetBrains Mono"; then
  echo -e "\033[1m\033[31mFonte JetBrains Mono já instalada. Saindo.\033[0m\n"
  exit 0
fi

# Verificando se o diretório ~/.fonts existe
if [ ! -d ~/.fonts ]; then
  echo "\033[1m\033[36mDiretório ~/.fonts não existe. Criando...\033[0m\n"
  mkdir ~/.fonts
fi

# Baixando fontes com HTTPS
echo "\033[1m\033[36mBaixando fontes com HTTPS...\033[0m\n"
wget -O ~/.fonts/JetBrainsMono-2.304.zip https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip # JetBrains Mono font

# Descompactando fontes
echo "\033[1m\033[36mDescompactando fontes...\033[0m\n"
unzip ~/.fonts/JetBrainsMono-2.304.zip -d ~/.fonts

# Removendo arquivos desnecessários
echo "\033[1m\033[36mRemovendo arquivos desnecessários...\033[0m\n"
rm ~/.fonts/JetBrainsMono-2.304.zip

# Atualizando cache de fontes
echo "\033[1m\033[36mAtualizando cache de fontes...\033[0m\n"
fc-cache -f -v ~/.fonts/fonts/ttf

# Listando fontes instaladas
echo "\033[1m\033[36mListando fontes instaladas...\033[0m\n"
fc-list | grep JetBrains

# Mensagem de conclusão
echo "\033[1m\033[32mInstalação das fontes concluída.\033[0m\n"
