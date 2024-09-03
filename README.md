
# Vim Configuration

This is a customized Vim configuration that enhances the editing experience with various plugins, key mappings, and settings optimized for efficiency and functionality. Below is a detailed explanation of the settings and key mappings included in this configuration.

## Prerequisites

- **Vim 8.0+** or **Neovim** (some settings are specific to Vim)
- **Vundle**: The plugin manager used in this configuration.

## Setup

1. **Install Vundle** (if not already installed):
   ```sh
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

2. **Clone this configuration** into your `.vimrc`:
   ```sh
   curl -o ~/.vimrc https://raw.githubusercontent.com/your-repo/your-config/master/.vimrc
   ```

3. **Install the plugins**:
   Open Vim and run:
   ```vim
   :PluginInstall
   ```

## Key Mappings

- **Leader key** is set to space (` `).
- `<Leader>f` : Open files using `fzf`.
- `<Leader>rg` : Search using `Rg`.
- `<Leader>b` : List buffers.
- `<Leader>h` : Show command history.
- `<Leader>c` : Show available commands.
- `<Leader>e` : Toggle `NERDTree`.

### Moving Lines
- `<C-k>` and `<C-j>` : Move selected lines or current line up and down.

### Terminal
- `<Leader>t` : Open a terminal window.

### Tab Navigation
- `<Tab>` : Save the file and switch to the next buffer.
- `<S-Tab>` : Save the file and switch to the previous buffer.

### Window Zoom
- `<Leader>z` : Toggle zoom for the current window using `ZoomWinTab`.

### Silicon (Code Screenshot)
- `<Leader>s` : Take a screenshot of selected code using `Silicon`.

## Plugins

This configuration includes the following plugins:

- **`VundleVim/Vundle.vim`**: Plugin manager.
- **`junegunn/fzf` and `junegunn/fzf.vim`**: Fuzzy finder.
- **`preservim/nerdtree`**: File explorer.
- **`vim-airline/vim-airline`** and **`vim-airline/vim-airline-themes`**: Status/tabline.
- **`segeljakt/vim-silicon`**: Code screenshots.
