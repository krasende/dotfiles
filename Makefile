.PHONY: bash zsh nvim ghostty vim

bash:
	ln -sf ~/git/dotfiles/bashrc ~/.bashrc

zsh:
	ln -sf ~/git/dotfiles/zshrc ~/.zshrc

ghostty:
	mkdir -p ~/.config/ghostty
	ln -sf ~/git/dotfiles/ghostty ~/.config/ghostty/config

nvim:
	rm -rf ~/.config/nvim
	mkdir ~/.config/nvim
	ln -s ~/git/dotfiles/nvim/* ~/.config/nvim

vim:
	rm -rf ~/.vim
	mkdir ~/.vim
	ln -s ~/git/dotfiles/vim/* ~/.vim/
