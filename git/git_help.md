#git help
#connect
ssh-key

use exist id_rsa or ssh-keygen

cat  ~/.ssh/id_rsa >  ~/.ssh/

chmod 400 ~/.ssh/id_rsa

if new keygen:

cp ~/.ssh/id_rsa.pub to github.com

ssh -T git@github.com

Git 全局设置:

git config --global user.name "romepeng"

git config --global user.email "romepeng@outlook.com"

or edit file:

~/.gitconfig

check git config:

git config list

echo "# helpme" >> README.md

git init

git add README.md

git commit -m "first commit"

git branch -M main

git remote add origin git://github.com:romepeng/helpme.git

git push -u origin main

分支
git branch 
git branch dev

git switch -c dev / checkout -b dev
git switch / checkout master

git merge master
git branch -d dev

覆盖本地
git fetch --all
git reset --hard origin/master

PULL: 与push相反
git pull origin master:master
git pull origin master 
git pull (已经关联）

clone reps:
git clone git@github.com:romepeng/linux-onekey-setup.git
git files, raw cp url:
wget https://raw.githubusercontent.com/romepeng/linux-onekey-setup/main/setup_first.sh



