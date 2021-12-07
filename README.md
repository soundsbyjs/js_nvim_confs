# js_nvim_confs
My confs for neovim


Sup. I will inevitably brick my system or get fed up with using the default
config on a VM one day, so here's my init.vim

# Features
Transparent background so you can use a dropdown terminal

Italics for function defs and comments

The sexiest theme in the history of vim

Syntax highlighting

The only good leader key ("," of course)

# Installation

1. make a loop de loop and git pull, and your neovim is looking cool!

2. install python for nvim

```pip install neovim```

3. install javascript for coc-nvim

```sudo curl -sL install-node.vercel.app/lts | sudo bash```

```sudo pacman -S ccls``` for the c/c++ LSP

4. run ```:PlugInstall```

5. run ```:CocInstall```, config for your favorite languages

6. get yourself a sexy font. try nerdfonts-git on the AUR. I'm partial to roboto mono medium

# Changelog

```12/7/21```

Changed autocomplete to Coc because it uses LSP

Fixed the brackets plugin jumping to a closed bracket instead of placing one >:(
