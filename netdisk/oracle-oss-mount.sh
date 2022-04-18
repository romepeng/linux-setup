#!/bin/bash
#unmount /home/rome/mnt/oracle20g

s3fs oracle20g /home/rome/mnt/oracle20g/  -o endpoint=us-ashburn-1 -o passwd_file=${HOME}/.passwd-s3fs -o url=https://idxmds8j7e0e.compat.objectstorage.us-ashburn-1.oraclecloud.com/ -o nomultipart -o use_path_request_style -o nonempty

#nohup s3fs oracle20g /home/rome/mnt/oracle20g/ -o endpoint=us-ashburn-1 -o passwd_file=/home/rome/.passwd-s3fs -o url=https://idxmds8j7e0e.compat.objectstorage.us-ashburn-1.oraclecloud.com/ -o nomultipart -o use_path_request_style 2&>1


