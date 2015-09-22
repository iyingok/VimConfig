echo "Hello!"
echo "We will install vimrc for Alex Qian."

which git > /dev/null
if [ "$?" != "0" ]; then
  echo "...The git Tools Must install."
  exit 1
fi

which vim > /dev/null
if [ "$?" != "0" ]; then
  echo "...The vim Tools Must install."
  exit 1
fi

#git submodule init
#git submodule update
git submodule update --init --recursive
#git submodule foreach 'git checkout $(git rev-parse --abbrev-ref HEAD)'
git submodule foreach 'git checkout master'

if [ ! -f ~/.vimrc ]; then
  ln -sfn ~/.vim/vimrc ~/.vimrc
fi

echo "Enjoy!"

vim +BundleInstall +qall 2>/dev/null
