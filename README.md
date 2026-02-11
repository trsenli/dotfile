# Dotfiles

个人配置文件，使用 GNU Stow 管理。

## 目录结构

```
dotfile/
├── git/           # Git 配置
├── nvim/          # Neovim 配置
├── tmux/          # Tmux 配置
├── zsh/           # Zsh 配置
├── ghostty/       # Ghostty 终端配置
├── aerospace/     # Aerospace 窗口管理器配置
├── ranger/        # Ranger 文件管理器配置
└── zellij/        # Zellij 终端复用器配置
```

## 安装

### 前置要求

安装 GNU Stow：
```bash
# macOS
brew install stow

# Ubuntu/Debian
sudo apt install stow

# Arch Linux
sudo pacman -S stow
```

### 使用步骤

1. 克隆仓库：
```bash
git clone git@github.com:zllynx/dotfile.git ~/dotfile
cd ~/dotfile
```

2. Stow 所有模块：
```bash
# 单独 stow 某个模块
stow git
stow nvim
stow zsh
stow tmux

# 或者一次性 stow 所有模块
for dir in */; do stow "${dir%/}"; done
```

3. 这会在 home 目录创建符号链接，例如：
```
~/.gitconfig      -> ~/dotfile/git/.gitconfig
~/.gitmessage     -> ~/dotfile/git/.gitmessage
~/.zshrc          -> ~/dotfile/zsh/.zshrc
~/.tmux.conf      -> ~/dotfile/tmux/.tmux.conf
```

## 更新配置

修改配置文件后：

```bash
cd ~/dotfile

# 重新链接某个模块
stow -R git

# 重新链接所有模块
for dir in */; do stow -R "${dir%/}"; done

# 查看会做什么改动（不实际执行）
stow -n -R git
```

## 卸载

```bash
cd ~/dotfile

# 删除某个模块的链接
stow -D git

# 删除所有链接
for dir in */; do stow -D "${dir%/}"; done
```

## 配置说明

### Git
- 设置 commit message 模板
- 配置 mergetool 优先级：vscode > nvim > vim

### Neovim
- 个人 Neovim 配置

### Tmux
- 终端复用器配置
- 包含本地配置文件 `.tmux_local.conf` 可自定义

### Zsh
- 使用 Zi (zimfw) 框架
- 包含个人别名和函数

## 常见问题

### Q: Stow 提示冲突怎么办？

A: 删除或备份现有文件后重新 stow：
```bash
mv ~/.gitconfig ~/.gitconfig.backup
stow git
```

### Q: 如何只在某些机器上使用特定配置？

A: 只 stow 你需要的模块：
```bash
# 只在服务器上使用 tmux 和 nvim
stow tmux
stow nvim
```

## License

MIT
