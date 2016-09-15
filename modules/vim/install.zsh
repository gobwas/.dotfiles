source "$(dirname $0)/../../utils/func.sh"

# Install fresh vim;
if has brew; then
	brew install vim;
fi

# Create vim directories.
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

# Install pathogen.
# See https://github.com/tpope/vim-pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Install vim-go
# See https://github.com/fatih/vim-go
if [ ! -d ~/.vim/bundle/vim-go ]; then
	git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
fi

# Install color themes.
# See http://vimcolors.com
# See https://github.com/rakr/vim-one
# See https://github.com/cseelus/vim-colors-lucid
curl -LSso ~/.vim/colors/lucid.vim https://raw.githubusercontent.com/cseelus/vim-colors-lucid/master/colors/lucid.vim
curl -LSso ~/.vim/colors/one.vim   https://raw.githubusercontent.com/rakr/vim-one/master/colors/one.vim

# Copy .vimrc if it not exists.
if [ ! -f ~/.vimrc ]; then
	cp vim.rc "$HOME/.vimrc"
fi
