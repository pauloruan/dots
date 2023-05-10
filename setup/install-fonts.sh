#!/bin/bash
# Script de instalação de fontes

# Verificando se a fonte já está instalada
if fc-list | grep -q "JetBrainsMonoNerdFont"; then
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
wget -O ~/.fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip # JetBrainsMono Nerd Font

# Descompactando fontes
echo "\033[1m\033[36mDescompactando fontes...\033[0m\n"
unzip ~/.fonts/JetBrainsMono.zip -d ~/.fonts

# Removendo arquivos desnecessários
echo "\033[1m\033[36mRemovendo arquivos desnecessários...\033[0m\n"
rm ~/.fonts/JetBrainsMono.zip

# Atualizando cache de fontes
echo "\033[1m\033[36mAtualizando cache de fontes...\033[0m\n"
fc-cache -f -v ~/.fonts/*.ttf

# Listando fontes instaladas
echo "\033[1m\033[36mListando fontes instaladas...\033[0m\n"
fc-list | grep JetBrainsMonoNerdFont

# Mensagem de conclusão
echo "\033[1m\033[32mInstalação das fontes concluída.\033[0m\n"
