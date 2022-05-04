
conda ctreate -n jpnb 

conda activate jpnb

pip install jupyter

jupyter notebook --generate-config

jupyter notebook password

vim ~/.jupyter/jupyter_notebook_config.py
#修改以下三个节点的配置，并把开头的 # 注释去掉
# c.NotebookApp.ip = '*' # 开启所有的IP访问，即可使用远程访问
#c.NotebookApp.open_browser = False # 关闭启动后的自动开启浏览器
#c.NotebookApp.port = 8888  # 设置端口8888

#set token/port/ip

jupyter notebook

