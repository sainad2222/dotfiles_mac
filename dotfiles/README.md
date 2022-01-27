# Setup:

- Clone as a bare repo

`git clone --bare https://github.com/sainad2222/dotfiles_mac.git $HOME/.cfg`

- Add *dotfiles* alias

`echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> ~/.zshrc`

- Source zshrc or Restart shell

`source ~/.zshrc`

- Force checkout

`dotfiles checkout -f`

- Set the flag showUntrackedFiles to no on this specific (local) repository

`dotfiles config --local status.showUntrackedFiles no`
