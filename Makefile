
config: ## install configuration
	echo "symlink dotfile config \n"
	ln -vsfn ${PWD}/.config/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
	ln -vsfn ${PWD}/.config/kitty/theme.conf ${HOME}/.config/kitty/theme.conf
	ln -vsfn ${PWD}/.config/nvim ${HOME}/.config/nvim
	ln -vsfn ${PWD}/.gitconfig ${HOME}/.gitconfig
	# ln -vsfn ${PWD}/.p10k.zsh ${HOME}/.p10k.zsh
	ln -vsfn ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsfn ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vsfn ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
	# ln -vsfn ${PWD}/.vimrc ${HOME}/.vimrc
	# depend on each resolution

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help
