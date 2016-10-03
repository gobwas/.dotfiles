source "$(dirname $0)/../../utils/func.sh"

# Install fresh vim;
if has brew; then
	brew install vim --with-lua;
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

# Install vim-lastplace
# See https://github.com/dietsche/vim-lastplace
if [ ! -d ~/.vim/bundle/vim-lastplace ]; then
	git clone git://github.com/dietsche/vim-lastplace.git ~/.vim/bundle/vim-lastplace
fi

# Install NERDTree
# See https://github.com/scrooloose/nerdtree
if [ ! -d ~/.vim/bundle/nerdtree ]; then
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# Install Neocomplete
# See https://github.com/Shougo/neocomplete.vim
#if [ ! -d ~/.vim/bundle/neocomplete ]; then
#	git clone https://github.com/Shougo/neocomplete.vim ~/.vim/bundle/neocomplete
#fi

# Install tagbar
# See https://github.com/majutsushi/tagbar
if [ ! -d ~/.vim/bundle/neocomplete ]; then
	git clone https://github.com/majutsushi/tagbar ~/.vim/bundle/tagbar
fi

# Install color themes.
# See http://vimcolors.com
# See https://github.com/rakr/vim-one
# See https://github.com/cseelus/vim-colors-lucid
curl -LSso ~/.vim/colors/lucid.vim https://raw.githubusercontent.com/cseelus/vim-colors-lucid/master/colors/lucid.vim
curl -LSso ~/.vim/colors/one.vim   https://raw.githubusercontent.com/rakr/vim-one/master/colors/one.vim

# Copy .vimrc if it not exists.
if [ ! -f ~/.vimrc ] || [ "$DOT_FORCE" -eq "1" ]; then
	cp "$(dirname $0)/vim.rc" "$HOME/.vimrc"
fi
