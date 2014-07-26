# Steps to configuring my environment
#
# - Install homebrew
# -- Install rvm, mysql, macvim
# - Link up Dropbox bin to ~/bin
# - Link bash, vim, and other config files
# - Install fonts
#

desc "Bootstrap the whole environment. This is for new machines."
task :bootstrap => ["setup:dropbox:bin", "setup:fonts", "setup:ack:config", 
                    "setup:vim:janus", "setup:vim:config", "setup:ruby:config", 
                    "setup:zsh:config", "setup:ssh:config", "setup:pow:config", "setup:git:config"] do
end

namespace :setup do

  desc "Link ~/Library/Fonts to Dropbox"
  task :fonts do
    sh "cp -r ~/.dotfiles/fonts/* ~/Library/Fonts/"
  end

  namespace :dropbox do
    desc "Link to Dropbox bin folder"
    task :bin do
      sh "ln -nsf ~/Dropbox/bin ~/bin"
    end
  end

  namespace :vim do

    desc "Link ~/.vim to janus"
    task :janus do
      sh "ln -nsf ~/.dotfiles/vim/janus ~/.vim"
    end

    desc "Link vim config files"
    task :config do
      sh "ln -nsf ~/.dotfiles/vim/customization ~/.janus"
      sh "ln -nsf ~/.dotfiles/vim/vimrc.before ~/.vimrc.before"
      sh "ln -nsf ~/.dotfiles/vim/gvimrc.before ~/.gvimrc.before"
      sh "ln -nsf ~/.dotfiles/vim/vimrc.after ~/.vimrc.after"
      sh "ln -nsf ~/.dotfiles/vim/gvimrc.after ~/.gvimrc.after"
    end
  end

  namespace :zsh do
    desc "Link zsh config files"
    task :config do
      sh "ln -nsf ~/.dotfiles/zsh/zshenv ~/.zshenv"
      sh "ln -nsf ~/.dotfiles/zsh/zshrc ~/.zshrc"
    end
  end

  namespace :ssh do
    desc "Link SSH folder"
    task :config do
      sh "ln -nsf ~/.dotfiles/ssh ~/.ssh"
    end
  end

  namespace :pow do
    desc "Link Pow config"
    task :config do
      sh "ln -nsf ~/.dotfiles/pow/powconfig ~/.powconfig"
    end
  end

  namespace :git do
    desc "Link gitconfig"
    task :config do
      sh "ln -nsf ~/.dotfiles/git/gitconfig ~/.gitconfig"
    end
  end

  namespace :ruby do
    desc "Link config files" 
    task :config do
      sh "ln -nsf ~/.dotfiles/ruby/irbrc ~/.irbrc"
      sh "ln -nsf ~/.dotfiles/ruby/gemrc ~/.gemrc"
    end
  end

  namespace :ack do
    desc "Link config file"
    task :config
    sh "ln -nsf ~/.dotfiles/ackrc ~/.ackrc"
  end
end
