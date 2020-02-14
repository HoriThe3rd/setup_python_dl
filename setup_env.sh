#!/bin/bash

# Check the argument.
if [ $# -ne 1 ]; then
    echo "Invalid argument. Please give me a new python environment name you want to create."
    exit 1
fi

# Install required packages.
sudo apt update
sudo apt install build-essential \
                zlib1g-dev \
                libbz2-dev \
                libreadline6-dev \
                libsqlite3-dev \
                libssl-dev \
                libffi-dev \
                tk-dev

# Check the installation
if [ $? -ne 0]; then
    echo "apt install command failed. Exit this script."
    exit 1
fi

echo "> Start python_env_setup script ..."
# Please set the python version which you want to install.
PYTHON_VERSION=3.6.5

# Set the given python environment name.
PYENV_NAME=$1

echo "> Clone pyenv git repository ..."
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# Setup arguments.
PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

echo "> Setup .bashrc ..."
echo '# pyenv settings' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

echo "> Installing pyenv-virtualenv ..."
git clone http://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

echo "> Installing Python ${PYTHON_VERSION} ..."
pyenv install $PYTHON_VERSION

echo "> Create virtual environment ..."
pyenv virtualenv $PYTHON_VERSION $PYENV_NAME

echo "> Apply the environment to your global environment ..."
pyenv global $PYENV_NAME

echo "> Installing python packages ..."
pip install numpy six matplotlib pandas opencv-python opencv-contrib-python Pillow jupyter

echo -e "\nScript finished.\n###  PLEASE RESTART YOUR TERMINAL.  ###"
