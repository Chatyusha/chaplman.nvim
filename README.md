# Chaplman.nvim

Please read help for details.

"Chaplman" stands for "**Cha**tyusha **Pl**gin **Man**ager", and it is a plugin manager for vim/neovim.

  - Requirements
  - Usage
  - Features
  - Future Work

## Requirements
  
  - Vim(version 8.0 or later) or Neovim
  - bash or zsh

## Usage

## Install
  
  1. Define insallation directory before you use chaplman. (default installation directory is `~/.cache/chaplman`) 
    
    Running below script, you can get chaplman and make installation directory easily.
  
For example, MacOS or Linux

- MacOS/Linux

  ```
  curl https://raw.githubusercontent.com/Chatyusha/chaplman.vim/master/bin/installer.sh > installer.sh
  # For example, we just use `~/.cache/chaplman` as installation directory.
  sh ./install.sh ~/.cache/chaplman
  ```

## Example

  ```vimrc/init.vim
  set runtimepath+=~/.cache/chaplman/repo/github.com/Chatyusha/chaplman.vim
  let g:plugins_dir=$HOME . "/.cache/chaplman/repo/github.com"
  ```

## Features

  - You can write the configuration file with json.
  - You can change the settings for each project.

## Future Work
  
  - A system where plugins can be installed on the editor
  - System to select plugins to load by filetype
  - Plugin uninstaller

