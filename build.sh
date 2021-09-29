#!/bin/bash

if [ -z $(command -v brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -z $(command -v vagrant) ]; then
  brew install vagrant
fi

if [ -z $(command -v virtualbox) ]; then
  brew install virtualbox
fi

vagrant up
