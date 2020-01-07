#!/bin/bash

chsh -s /bin/zsh

echo "install homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install vim pyenv pyenv-virtualenv

echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cat >> ~/.zshrc <<EOF
export PATH="\$PATH:\$HOME/.rvm/bin"

export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="\$HOME/.pyenv"
export PATH="\$PYENV_ROOT/bin:\$PATH"

if which pyenv > /dev/null;
  then eval "\$(pyenv init -)";
fi

# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null;
  then eval "\$(pyenv virtualenv-init -)";
fi

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home
PATH=\$JAVA_HOME/bin:\$PATH:.
CLASSPATH=\$JAVA_HOME/lib/tools.jar:\$JAVA_HOME/lib/dt.jar:.
export JAVA_HOME
export PATH
export CLASSPATH

alias vim='/usr/local/bin/vim'
EOF

echo "install rvm"
\curl -sSL https://get.rvm.io | bash -s stable --rails

echo "install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

source ~/.zshrc

nvm install stable

npm config set registry https://registry.npm.taobao.org
