#!/bin/bash
cd "$(dirname "$0")"
git add main.cpp
git commit -m "$(date +%Y-%m-%d) 更新" && git push
echo "已上传到 GitHub"
