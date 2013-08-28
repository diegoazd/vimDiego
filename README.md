dotvim
======
inicializarlo:
git submodule update --init bundle/vim-colors-solarized

Actualizar un solo plugin
cd ~/.vim/bundle/fugitive
git pull origin master

Actualizar todos los plugins
git submodule foreach git pull origin master

