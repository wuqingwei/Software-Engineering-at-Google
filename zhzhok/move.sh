#!/bin/bash
###
 # @Descripttion: 
 # @version: 
 # @Author: wuqingwei217@163.com
 # @Date: 2024-09-12 17:52:36
 # @LastEditors: wuqingwei217@163.com
 # @LastEditTime: 2024-09-12 17:52:38
 # Copyright (c) 2024 by Weyo, All Rights Reserved. 
### 

find . -mindepth 2 -maxdepth 2 -type f -name "*.md"

# 遍历当前目录下所有 .zhzh.md 文件
for file in *.zhzh.md; do
    # 检查文件是否存在（避免处理 *.zhzh.md 本身）
    if [ -f "$file" ]; then
        # 提取不包含 .zhzh.md 的文件名部分
        dirname=${file%.zhzh.md}
        
        # 创建目标目录（如果不存在）
        mkdir -p "$dirname"
        
        # 移动文件到目标目录
        mv "$file" "$dirname/"
        
        echo "Moved $file to $dirname/"
    fi
done