# Installation
Based on @jasonkarns's excellent dotfiles example

1. `git clone --no-checkout https://github.com/jxpx777/dotfiles.git`
2. `git config core.worktree "$HOME"`
3. `git config core.sparseCheckout true`
4. `printf '/*\n!README.md' | git sparse-checkout set --stdin`
5. `git checkout main`
6. `echo "gitdir: ~/dotfiles/.git" > ~/.git`
7. `git submodule update --init --recursive`
8. Install [Homebrew][]: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
9. `brew bundle`


[Homebrew]: https://brew.sh
