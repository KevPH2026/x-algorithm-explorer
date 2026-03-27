#!/bin/bash
# 发布 x-algorithm-explorer skill 到 GitHub

echo "=== X Algorithm Explorer Skill 发布脚本 ==="
echo ""
echo "步骤1: 在 GitHub 上创建仓库"
echo "请访问: https://github.com/new"
echo "仓库名: x-algorithm-explorer"
echo "描述: Agent Skill for exploring X (Twitter) Recommendation Algorithm"
echo "设置为 Public"
echo ""
read -p "按 Enter 继续..."

echo ""
echo "步骤2: 推送到 GitHub"
cd ~/.openclaw/workspace/skills/x-algorithm-explorer

# 添加远程仓库
git remote add origin https://github.com/KevPH2026/x-algorithm-explorer.git

# 推送代码
git push -u origin main

echo ""
echo "步骤3: 创建 Release"
echo "访问: https://github.com/KevPH2026/x-algorithm-explorer/releases/new"
echo "上传文件: ~/.openclaw/workspace/x-algorithm-explorer.skill"
echo ""
echo "完成！"
