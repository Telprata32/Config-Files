# Config-File
**Contains all my config files** 

Set up the git bare folder ("dotfiles") before doing anything:
1. install git
2. Create a folder called "dotfiles" in the home folder
3. Do a "git init --bare into the file"
4. Download fish and copy the .config/fish/config.fish texts and paste into local config.fish
5. Then perform a "config clone {this repo}" in the home folder

Pre-Requirsites for setting up vim:
1. install nodejs
2. go to: https://github.com/junegunn/vim-plug , and perform "curl" to install plugin manager

After downloading the config files, here is the procedure

1. Run the "sudo apt install ccls" (for the c++ support in the coc-settings.json file)
2. Install the ctags from https://github.com/universal-ctags/ctags and follow the steps

Extra notes

1. Fonts used for terminal and vim in general: CaskaydiaCove Nerd Font
2. Ligatures enabled for vim and terminal

# General Terminal KeyBindings
**Zoom In** - Ctrl +  
**Zoom Out** - Ctrl -  
**Reset Zoom** - Ctrl + Alt + 0  
# Vim KeyBindings 
## General
**Append next line end of the current line** - `J`   

**Delete a whole line of text but the line break (n)** - `<A-d>`

### Incremental search

#### - After Inc. Search:
**Next Search** - `n`  
**Prev. Search** - `N`
#### - During Inc. Search:
**Next Search** - `<C-g>`  
**Prev. Search** - `<C-t>` 


### Moving Splits
**Far Left** - `<C-w>H`  
**Far Right** - `<C-w>L`  
**Far Down** - `<C-w>J`  
**Far Up** - `<C-w>K`    

### Moving lines up/down the editor

**Move up** - `<A-k>`  
**Move down** - `<A-j>`

### Maximizing/Minimizing Splits

**Max/Min** - `<leader>z`
## Vim-Fugitive
**`<leader>g`** - bring up vim-fugitive menu

## Vim-Tagbar (To view all variables/functions/classes/etc)
**`<leader>v`** - bring up tagbar 
## Gitgutter
**`]c`** - next hunk  
**`[c`** - previous hunk  
**`<leader>hp`** - preview diff hunk  
**`<leader>hs`** - stage hunk  
**`<leader>hu`** - undo hunk
## Ctags
**`<C-]>`** - go to variable/function's declaration  
**`<C-t>`** - go back to original cursor location

## Vim CtrlP (like Ctrl + P on VS Code)
**`<C-p>`** - to start up  
**`<C-f>`** - cycle to next mode  
**`<C-b>`** - cycle to previous mode  
**`<C-d>`** - switch to "Search by file name" (press again to switch back)

**[Full CtrlP documentation: [http://ctrlpvim.github.io/ctrlp.vim](/http://ctrlpvim.github.io/ctrlp.vim/)]**

## Nerd Commenter
**`<C-_>`** - Toggles the comment state of selected lines ("_" represents "/")  
**`<leader>cs`** - Comments out selected lines with a pretty block format  

**[More info at: [https://github.com/preservim/nerdcommenter](https://github.com/preservim/nerdcommenter)]**

## Check out in the future
- Snippets feature for vim: [https://bhupesh-v.github.io/learn-how-to-use-code-snippets-vim-cowboy/](https://bhupesh-v.github.io/learn-how-to-use-code-snippets-vim-cowboy/)
