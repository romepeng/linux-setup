#!/bin/bash
# for ubuntu x_86_64 or aarch_64 cpu
#from <https://conda.io/projects/conda/en/latest/user-guide/install/macos.html#install-macos-silent> 
clear

echo -e "\t start installsilent miniconda"
MINICONDA_PATH="$HOME/minconda"
wget  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -m).sh -O  ~/miniconda.sh bash  ~/miniconda.sh -b -p ${MINICONDA_PATH}
${MINICONDA_PATH}/bin/conda init
source  ~/.bashrc
