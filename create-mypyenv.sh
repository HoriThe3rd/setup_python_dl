#!/bin/zsh
PYTHON_VER=3.8.9
PYENV_NAME='myenv'

pyenv install $PYTHON_VER
pyenv virtualenv $PYTHON_VER $PYENV_NAME
pyenv global $PYENV_NAME

pip install --upgrade pip
pip install -r requirements.txt