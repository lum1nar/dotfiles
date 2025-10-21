[Chinese Version](./README_zh.md)
![image](./static/nvim_start.png)

# Development Environment Configuration

Modern development setup for shell and editor utilities.

## Requirements

### Core Applications

- **nvim** >= 0.11
- **lazy.nvim** - Plugin manager
- **nodejs** >= 20 - JavaScript runtime
- **ripgrep** - Fast file search
- **tmux** - Terminal multiplexer
- **alacritty** - GPU-accelerated terminal

### Shell Environment

- **zsh** with **oh-my-zsh**
- **p10k** - Powerlevel10k theme
- **zsh-autosuggestions**
- **zsh-syntax-highlighting**
- **zsh-vi-mode**

### Utilities & Fonts

- **stow** - Dotfile management
- **JetBrainsMono Nerd Font**
- **Monocraft** - Minecraft-inspired font

## Neovim Keybindings

### Text Manipulation & Navigation

| Key Combination | Mode   | Description                      |
| --------------- | ------ | -------------------------------- |
| `J`             | Visual | Move selection down              |
| `K`             | Visual | Move selection up                |
| `space + y`     | Visual | Copy selection                   |
| `ctrl + w`      | Insert | Delete word to the left          |
| `ctrl + h`      | Insert | Delete character to the left     |
| `ctrl + o`      | Normal | Return to previous jump location |
| `space + f`     | Normal | Format code                      |
| `gcc`           | Normal | Toggle comment                   |

### Project & File Management

| Key Combination | Mode   | Description                |
| --------------- | ------ | -------------------------- |
| `space + p + f` | Normal | Find project files         |
| `space + p + r` | Normal | Find recently opened files |
| `space + p + s` | Normal | Search files by content    |
| `space + p + b` | Normal | Open file browser          |
| `space + u`     | Normal | Open undotree              |

### Code Intelligence & LSP

| Key Combination            | Mode           | Description                        |
| -------------------------- | -------------- | ---------------------------------- |
| `ctrl + n` / `tab`         | Insert         | Next completion item               |
| `ctrl + p` / `shift + tab` | Insert         | Previous completion item           |
| `ctrl + y` / `Enter`       | Insert         | Accept LSP completion              |
| `ctrl + l`                 | Insert, Visual | Go to next snippet placeholder     |
| `ctrl + h`                 | Insert, Visual | Go to previous snippet placeholder |
| `space + d + d`            | Normal         | Go to definition under cursor      |
| `space + d + f`            | Normal         | Find references                    |
| `space + d + n`            | Normal         | Go to next error                   |
| `space + d + p`            | Normal         | Go to previous error               |

### AI Integration

| Key Combination | Mode    | Description                     |
| --------------- | ------- | ------------------------------- |
| `space + c + c` | NORMAL  | Open AI chat                    |
| `space + c + a` | NORMAL  | Open AI actions                 |
| `space + c + h` | NORMAL  | Open AI Chat History            |
| `gcs`           | In CHAT | Create summary for current chat |
| `gbs`           | In CHAT | Browse saved chat summary       |

### Focus & Execution

| Key Combination | Mode   | Description                    |
| --------------- | ------ | ------------------------------ |
| `space + z + z` | Normal | Toggle zen mode                |
| `space + r`     | Normal | Execute current file (.c, .py) |

## Git Configuration

### Set Neovim as your default Git editor:

```bash
git config --global core.editor "nvim"
```

### Add DeepSeek API

```bash
#~/.zshrc.local
export DEEPSEEK_API_KEY="YOUR_API_KEY"
```
