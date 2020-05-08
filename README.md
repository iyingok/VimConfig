# VimConfig

---

This is my vimrc file.
The vim config is so diffcult.
But now, with this, I can share it at my muliti computers. 

---

###Memory: 

1.  backup folder is for backup file.
  I add .gitignore file in it, So the folder can be manager with git.
 
2.  bundle/vbundle is vbundle-plugin, it is must clone with:
    https://github.com/gmarik/vundle.git
    I use git submodule manager it. 

---  
 
###Install Step: 
```
cd  
git clone https://github.com/iyingok/VimConfig.git .vim  
ln -sfn ./vimrc ~/.vimrc  
git submodule update --init --recursive  
vim +BundleInstall +qall  
```



