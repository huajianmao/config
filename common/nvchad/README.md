# Config for Neovim (based on NvChad)

##

### vim.wo.relativenumber = true

relative line number

### vim.g.nvim_tree_group_empyt = 1

```shell
a/b/c/d/e

a
  b
    c
      d
        e
```

### Mappings

```lua
local map = nvchad.map
-- map("n", "<leader>tt", ":FloatermToggle <CR>")
map("n", "<leader><C-w>", ":bp<bar>sp<bar>bn<bar>bd<CR>")
```

## Install dependant tools

```shell
npm install -g prettier @fsouza/prettierd typescript typescript-language-server vscode-langservers-extracted eslint

sudo apt-get install ripgrep fd-find fzf
```

## Treesitter

```vim
:TSInstall css rust
```

## Plugins Install

```vim
:PackerInstall
```
