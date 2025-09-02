-- Exibir número das linhas
vim.opt.number = true -- Exibir números de linha

-- Configuração de tabulação
vim.cmd("set tabstop=2") -- Número de espaços que uma tabulação representa
vim.cmd("set shiftwidth=2") -- Número de espaços para cada nível de indentação
vim.cmd("set softtabstop=2") -- Número de espaços que uma tabulação representa ao editar
vim.cmd("set expandtab") -- Converter tabulações em espaços
vim.cmd("set smarttab") -- Usar tabulações inteligentes
vim.cmd("set smartindent") -- Indentação inteligente
vim.cmd("set autoindent") -- Indentação automática

-- Definir teclas líderes
vim.g.mapleader = " " -- Tecla líder global
vim.g.maplocalleader = "\\" -- Tecla líder local

vim.opt.fillchars = { eob = " " }
