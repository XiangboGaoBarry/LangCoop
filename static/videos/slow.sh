# #!/bin/bash

# # 设置输入目录（可修改为你的路径），默认当前目录
# input_dir="."

# # 遍历当前目录中的所有 .mp4 文件
# for file in "$input_dir"/*.mp4; do
#     # 获取不带扩展名的文件名
#     filename=$(basename "$file" .mp4)

#     # 设置输出文件名
#     output_file="${filename}_slow.mp4"

#     # 调用 FFmpeg 让视频变慢 3 倍
#     ffmpeg -i "$file" -filter:v "setpts=2.0*PTS" "$output_file"

#     echo "已处理: $file -> $output_file"
# done


#!/bin/bash

# # 设置输入目录（可修改为你的路径），默认当前目录
# input_dir="."

# # 遍历当前目录中的所有 .mp4 文件
# for file in "$input_dir"/*_slow.mp4; do
#     # 获取不带扩展名的文件名
#     filename=$(basename "$file" .mp4)

#     # 设置输出文件名
#     output_file="${filename}_downscale.mp4"

#     # 使用 ffmpeg 进行缩放
#     ffmpeg -i "$file" -vf "scale=iw/2:ih/2" -c:v libx264 -crf 23 -preset fast -c:a aac -b:a 128k "$output_file"

#     echo "已处理: $file -> $output_file"
# done


#!/bin/bash

input_dir="."  # 当前目录

# 遍历所有 .mp4 文件
for file in "$input_dir"/*.mp4; do
    # 获取文件名（去掉扩展名）
    filename=$(basename "$file" .mp4)

    # 设置输出文件名
    output_file="${filename}_hevc.mp4"

    # 使用 ffmpeg 进行 H.265 转换
    ffmpeg -i "$file" -c:v libx265 -crf 35 -preset fast -c:a aac -b:a 128k "$output_file"

    echo "已处理: $file -> $output_file"
done