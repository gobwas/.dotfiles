source "$HOME/.dotfiles/utils/func.sh"

# Install fresh vim;
# Install it unconditionally on mac to get rich set of options enabled.
if has brew; then
	brew install vim --with-lua;
	ln -s /usr/local/bin/vim /usr/local/bin/vi
fi

# Create vim directories.
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/_{swap,backup,undo}

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

# Install vim-gitgutter
# See github.com/airblade/vim-gitgutter
if [ ! -d ~/.vim/bundle/vim-gitgutter ]; then
	git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
fi

# Install vim-multiple-cursors
# See github.com/terryma/vim-multiple-cursors
if [ ! -d ~/.vim/bundle/vim-multiple-cursors ]; then
	git clone https://github.com/terryma/vim-multiple-cursors ~/.vim/bundle/vim-multiple-cursors
fi

# Install vim-abolish
# See https://github.com/tpope/vim-abolish
if [ ! -d ~/.vim/bundle/vim-abolish ]; then
	git clone https://github.com/tpope/vim-abolish ~/.vim/bundle/vim-abolish
fi

# Install tagbar
# See https://github.com/majutsushi/tagbar
if ! has ctags; then
	if has yum; then
		yum install ctags-etags;
	elif has brew; then
		brew install ctags;
	fi
fi

if [ ! -d ~/.vim/bundle/tagbar ]; then
	git clone https://github.com/majutsushi/tagbar ~/.vim/bundle/tagbar
fi

# Instal fuzzy finder.
if [ ! -d ~/.vim/bundle/fzf ]; then
	git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf
fi

# Install ALE (Asynchronous Lint Engine).
if [ ! -d ~/.vim/bundle/ale ]; then
	git clone https://github.com/w0rp/ale.git ~/.vim/bundle/ale
fi

# Install color themes.
# See http://vimcolors.com
# See https://github.com/rakr/vim-one
# See https://github.com/cseelus/vim-colors-lucid
curl -LSso ~/.vim/colors/lucid.vim    https://raw.githubusercontent.com/cseelus/vim-colors-lucid/master/colors/lucid.vim
curl -LSso ~/.vim/colors/one.vim      https://raw.githubusercontent.com/rakr/vim-one/master/colors/one.vim
curl -LSso ~/.vim/colors/gruvbox.vim  https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
curl -LSso ~/.vim/colors/material.vim https://raw.githubusercontent.com/hzchirs/vim-material/master/colors/vim-material.vim 

if [ ! -d ~/.vim/bundle/solarized ]; then
	git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/solarized
fi

# Copy .vimrc if it not exists.
if [[ ! -f ~/.vimrc ]] || [[ "$DOT_FORCE" -eq "1" ]]; then
	cp "$HOME/.dotfiles/modules/vim/dot.vimrc" "$HOME/.vimrc"
fi
