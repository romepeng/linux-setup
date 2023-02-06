To install on Debian-based Linux distributions such as Ubuntu, download the public GPG key and add the conda repository to the sources list.
# use root
# Install our public GPG key to trusted store

sudo -i

curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg

# Check whether fingerprint is correct (will output an error message otherwise)
gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806

# Add our Debian repo
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list

**NB:** If you receive a Permission denied error when trying to run the above command (because `/etc/apt/sources.list.d/conda.list` is write protected), try using the following command instead:
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" | sudo tee -a /etc/apt/sources.list.d/conda.list

apt update
apt install conda

source /opt/conda/etc/profile.d/conda.sh
conda -V

conda update conda

conda activate /deactivate

also:

#!/bin/bash
# for ubuntu x_86_64 or aarch_64 cpu
#from <https://conda.io/projects/conda/en/latest/user-guide/install/macos.html#install-macos-silent> 
clear

echo -e "\t start installsilent miniconda"
MINICONDA_PATH="$HOME/miniconda"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -m).sh -O  ~/miniconda.sh && bash  ~/miniconda.sh -b -p ${MINICONDA_PATH}

${MINICONDA_PATH}/bin/conda init && source  ~/.bashrc
