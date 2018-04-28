#!/usr/bin/env bash

unamestr=`uname`

which conda
if [ "$?" -eq 1 ]; then
    if [[ "$unamestr" == 'Linux' ]]; then
        wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O ~/miniconda.sh
    elif [[ "$unamestr" == 'Darwin' ]]; then
        wget https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
    fi

    bash ~/miniconda.sh -b -p $HOME/miniconda
    echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
else
    echo "Miniconda already installed"
fi

conda create -n py35_albu python=3.5
source activate py35_albu

pip install -r ./albu/requirements.txt
pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl
pip install torchvision

source deactivate


conda create -n py35_ternaus python=3.5
source activate py35_ternaus
pip install -r ./ternaus/requirements.txt
pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl
pip install torchvision

source deactivate


conda create -n py27 python=2.7
source activate py27

pip install -r requirements.txt
pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp27-cp27mu-manylinux1_x86_64.whl
pip install torchvision 

source deactivate


conda create -n py36_jupyter python=3.6
source activate py36_jupyter

pip install --upgrade pip
pip install jupyter

source deactivate
