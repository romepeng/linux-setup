#!/bin/bash

#from <https://conda.io/projects/conda/en/latest/user-guide/install/macos.html#install-macos-silent> 
echo -e "\t install miniconda"
MINICONDA_PATH="$HOME/minconda"
wget  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -m).sh -O  ~/miniconda.sh \
   bash  ~/miniconda.sh -b -f -p MINICONDA_PATH
   
MINICONDA_PATH/bin/conda init
source  ~/.bashrc
