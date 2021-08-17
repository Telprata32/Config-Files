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

# Vim KeyBindings and other How-to
## Vim-Fugitive
**<leader>** - bring up vim-fugitive menu
## Vim-Tagbar
**<leader>v** - bring up tagbar
## Gitgutter
**]c** - next hunk  
**\[c** - previous hunk  
**<leader>hp** - preview diff hunk  
**<leader>hs** - stage hunk  
**<leader>hu** - undo hunk
