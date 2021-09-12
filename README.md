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
  curl -OL "https://raw.githubusercontent.com/Chatyusha/chaplman.vim/master/bin/chaplman/installer.sh"
  chmod +x installer.sh
  # For example, we just use `~/.cache/chaplman` as installation directory.
  ./install.sh ~/.cache/chaplman
  ```

## Example

  ```vimrc/init.vim
  set runtimepath+=~/.cache/chaplman/repo/github.com/Chatyusha/chaplman.vim
  let g:plugins_dir=$HOME . "/.cache/chaplman/repo/github.com"
  ```
### DowloadPlugins

 To add a plugin, run `:call add('author/pluginname')`.

 For example, to install [Chatyusha](https://github.com/Chatyusha/TestVimPlugin), 
 `:call chaplman#add('Chatyusha/TestVimPlugin')`

### settings

  Plese write the project settings on `./.chaplman/settings.json`.

  For Example, [Chatyusha/TestVimPlugin](https://github.com/Chatyusha/TestVimPlugin)

```settings.json
  {
    "plugins":[
      {
        "repo":"Chatyusha/TestVimPlugin",
        "source":[
          "let g:sample_name='Tanya'"
        ]
      }
    ]
  }
```

## Tutorial

1. Install Chaplman

3. Run `mkdir test` and `cd test`

4. Open Vim/neovim and run the command: `:call chaplman#default()`

5. To download a Plugin (example ,`Chatyusha/TestVimPlugin`) , run `:call chaplman#add('Chatyusha/TestVimPlugin')`

6. Edit `./.chaplman/settings.json` like below (`:e ./.chaplman/settings.json`)
  
  ```settings.json
    {
      "plugins":[
        {
          "repo":"Chatyusha/TestVimPlugin",
          "source":[
            "let g:sample_name='Tanya'"
          ]
        }
      ]
    }
  ```
7. To load settings, run `:call chaplman#loadsettings()`

8. Run the following command : `:Hello`,and if you see "Hello World!", you have succeeded.

## Features

  - You can write the configuration file with json.
  - You can change the settings for each project.

## Future Work
  
  - A system where plugins can be installed on the editor
  - System to select plugins to load by filetype
  - Plugin uninstaller

