#!/bin/bash

# 根目錄
BASE_DIR="./src/assets/images/CABLE"

# 遍歷所有子目錄
for dir in "$BASE_DIR"/*/; do
  echo "Processing directory: $dir"
  
  # 初始化計數器
  count=1

  # 遍歷子目錄中的所有圖片文件
  for img in "$dir"/*.{jpg,jpeg,png,gif}; do
    if [[ -f "$img" ]]; then
      # 提取文件擴展名
      extension="${img##*.}"
      # 構建新的文件名
      new_name="${dir}$(printf "%03d" $count).${extension}"
      # 重命名文件
      mv "$img" "$new_name"
      echo "Renamed $img to $new_name"
      # 計數器加一
      ((count++))
    fi
  done
done

echo "Renaming completed."
