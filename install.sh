#!/bin/bash
# X Viral Engine - One-Click Install Script
# For OpenClaw Agent

set -e

SKILL_NAME="x-viral-engine"
SKILL_VERSION="3.0.0"
REPO_URL="https://github.com/KevPH2026/x-algorithm-explorer"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_banner() {
    echo ""
    echo -e "${BLUE}╔═══════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}       🚀 X Viral Engine Skill Installer           ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}            Version ${SKILL_VERSION}                     ${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

check_openclaw() {
    print_info "检查 OpenClaw 安装..."
    
    if [ -d "$HOME/.openclaw/skills" ]; then
        OPENCLAW_SKILLS_DIR="$HOME/.openclaw/skills"
    elif [ -d "$HOME/.config/openclaw/skills" ]; then
        OPENCLAW_SKILLS_DIR="$HOME/.config/openclaw/skills"
    else
        print_error "未找到 OpenClaw skills 目录"
        echo "请确保已安装 OpenClaw"
        exit 1
    fi
    
    print_success "找到 OpenClaw skills 目录: $OPENCLAW_SKILLS_DIR"
}

install_skill() {
    local target_dir="$OPENCLAW_SKILLS_DIR/$SKILL_NAME"
    
    print_info "安装 X Viral Engine..."
    
    if [ -d "$target_dir" ]; then
        print_warning "Skill 已存在，将更新..."
        rm -rf "$target_dir"
    fi
    
    if [ -f "./SKILL.md" ] && [ -f "./install.sh" ]; then
        print_info "从本地目录安装..."
        cp -r . "$target_dir"
    else
        print_info "从 GitHub 克隆..."
        git clone --depth 1 "$REPO_URL.git" "$target_dir"
    fi
    
    rm -rf "$target_dir/.git"
    rm -f "$target_dir/x-algorithm-explorer.zip"
    
    print_success "X Viral Engine 安装完成！"
}

show_usage() {
    echo ""
    echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}✅ 安装完成！${NC}"
    echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
    echo ""
    echo "Skill 已安装到: $OPENCLAW_SKILLS_DIR/$SKILL_NAME"
    echo ""
    echo "使用方法:"
    echo "  1. 重启你的 OpenClaw Agent"
    echo "  2. 开始生成 viral 内容:"
    echo ""
    echo "     • '给我生成一个 viral 帖子'"
    echo "     • '关于 [主题] 的 viral 内容'"
    echo "     • '优化这个帖子让它能火'"
    echo "     • '蹭 [热点] 的流量'"
    echo ""
    echo "快捷命令:"
    echo "     • 'viral mode' - 开启 viral 生成模式"
    echo "     • 'viral 优化: [内容]' - 优化现有内容"
    echo ""
    echo "更多信息:"
    echo "  GitHub: $REPO_URL"
    echo ""
}

main() {
    print_banner
    check_openclaw
    install_skill
    show_usage
}

main "$@"
