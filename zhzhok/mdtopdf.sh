#!/bin/bash

# 检查输入和输出目录是否提供
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

# 创建输出目录（如果不存在）
mkdir -p "$output_dir"

# 遍历输入目录中的所有 .md 文件
for md_file in "$input_dir"/*.md; do
    # 检查文件是否存在
    if [ -f "$md_file" ]; then
        # 提取文件名（不包括路径和扩展名）
        filename=$(basename "$md_file" .md)
        
        # 设置输出 PDF 文件路径
        pdf_file="$output_dir/${filename}.pdf"
        
        echo "Converting $md_file to $pdf_file"
        
        # 使用 pandoc 转换 MD 到 PDF
        pandoc "$md_file" -o "$pdf_file" --pdf-engine=xelatex -V mainfont="SimSun"
    fi
done

echo "Conversion complete!"
