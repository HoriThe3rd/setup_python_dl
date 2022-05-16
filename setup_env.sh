#!/bin/bash

# Arguments
# $1: Python version you want to install
# $2: Virtual environment name will be created by this script

# Check the argument.
if [ $# -ne 2 ]; then
    echo "Invalid argument. Please give me a new python environment name you want to create."
    exit 1
fi

# Get arguments
PYTHON_VERSION=$1
PYENV_NAME=$2

# Display the arguments and make confirmation
echo "---------------------------------"
echo "Please check given options below"
echo "---------------------------------"
echo "Python version: ${PYTHON_VERSION}"
echo "virtual env name: ${PYENV_NAME}"
echo "---------------------------------"

# Make a confirmation to setup.
read -p "Continue? [Y/n]: " yn
case "$yn" in
    [Yy]|"Yes"|"yes"|"YES")
        # Install required packages.
        sudo apt update
        sudo apt install -y build-essential \
                        zlib1g-dev \
                        libbz2-dev \
                        libreadline6-dev \
                        libsqlite3-dev \
                        libssl-dev \
                        libffi-dev \
                        tk-dev \
                        git

        # Check the installation
        if [ $? -ne 0]; then
            echo "apt install command failed. Exit this script."
            exit 1
        fi

        # Check existence of pyenv command.
        if type "pyenv" > /dev/null 2>&1; then
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
        else
            echo "pyenv already exists."
        fi

        echo "> Installing Python ${PYTHON_VERSION} ..."
        pyenv install $PYTHON_VERSION

        echo "> Create virtual environment ..."
        pyenv virtualenv $PYTHON_VERSION $PYENV_NAME

        echo "> Apply the environment to your global environment ..."
        pyenv global $PYENV_NAME

        echo "> Installing python packages ..."
        pip install --upgrade pip
        #pip install numpy six matplotlib pandas opencv-python opencv-contrib-python Pillow jupyter
        pip install -r requirements.txt

        echo -e "\nScript finished.\n###  PLEASE RESTART YOUR TERMINAL.  ###"
        ;;

    [Nn]|"No"|"no"|"NO")
        echo "Exit with nothing."
        exit 0
        ;;
esac