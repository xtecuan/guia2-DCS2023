#!/bin/zsh

usermod -L testuser
chage -E0 testuser
usermod -s /sbin/nologin testuser


