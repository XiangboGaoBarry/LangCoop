#!/bin/bash

# 设置输入目录（可修改为你的路径），默认当前目录
input_dir="."

# 遍历当前目录中的所有 .mp4 文件
for file in "$input_dir"/*.mp4; do
    # 获取不带扩展名的文件名
    filename=$(basename "$file" .mp4)

    # 设置输出文件名
    output_file="${filename}_slow.mp4"

    # 调用 FFmpeg 让视频变慢 3 倍
    ffmpeg -i "$file" -filter:v "setpts=2.0*PTS" "$output_file"

    echo "已处理: $file -> $output_file"
done