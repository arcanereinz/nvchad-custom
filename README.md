## Neovim with lsp, linting, formatting and debugging

### Installation instructions

1. install nvim 0.9+
```sh
snap install nvim --classic
```
2. install nvchad
```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```
3. enable icons to be displayed on neovim
```sh
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip -d jet-brains-mono-nerd-font JetBrainsMono.zip
mv jet-brains-mono-nerd-font ~/.local/share/fonts/
# for macos copy *.ttf to ~/Library/Fonts
# then open Font Book to verify
fc-cache -f -v
```
4. inside any typescript project install node types to allow lsp to read built-in types
```sh
npm install --save-dev @types/node
```
5. in neovim, resync Lazy package manager
```sh
:Lazy
```
6. in neovim, import os-level dependencies via custom mason mapping
```sh
:MasonInstallAll
```

### Plugin list

* nvim package manager: lazy
* os package manager: mason
* nvim language server: neovim/nvim-lspconfig
* nvim lint: mfussenegger/nvim-lint
* nvim formatter: mhartington/formatter.nvim
* nvim debugger: mfussenegger/nvim-dap
* nvim debugger ui: rcarriga/nvim-dap-ui

### Post Installation Instructions

* to get lsp working on redhat linux
```sh
npm install -g typescript-language-server typescript
```

* in neovim, to fix treesitter unable to access /usr/share/nvim/runtime/lua/
```sh
TSInstall comment
TSInstall all
```

* enable live grep (find in file)
```sh
sudo yum install ripgrep
```

* startup dap server for javascript debugging in neovim
```sh
echo 'alias dap="~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter 8123 127.0.0.1"' >> ~/.bashrc
```

* to get clipboard
```sh
yum install xclip
```

### Links

* https://www.youtube.com/watch?v=CVCBHHFXWNE
* https://mason-registry.dev/registry/list
