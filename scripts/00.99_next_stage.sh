#!/bin/bash

echo "1" > /etc/rm-install/stage

echo "sytemd enabled. Please exit and restart using wsl --user ${CREATED_USER}"
exit