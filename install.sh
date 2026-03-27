#!/bin/bash
# X Algorithm Explorer - One-Click Install Script
# For OpenClaw Agent

set -e

SKILL_NAME="x-algorithm-explorer"
SKILL_VERSION="2.0.0"
REPO_URL="https://github.com/KevPH2026/x-algorithm-explorer"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_banner() {
    echo ""
    echo -e "${BLUE}╔═══════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}      🚀 X Algorithm Explorer Skill Installer       ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}                 Version ${SKILL_VERSION}                  ${BLUE}║${NC}"
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
    
    # Find OpenClaw skills directory
    if [ -d "$HOME/.openclaw/skills" ]; then
        OPENCLAW_SKILLS_DIR="$HOME/.openclaw/skills"
    elif [ -d "$HOME/.config/openclaw/skills" ]; then
        OPENCLAW_SKILLS_DIR="$HOME/.config/openclaw/skills"
    else
        print_error "未找到 OpenClaw skills 目录"
        echo "请确保已安装 OpenClaw，或手动指定安装路径："
        echo "  export OPENCLAW_SKILLS_DIR=/path/to/skills"
        exit 1
    fi
    
    print_success "找到 OpenClaw skills 目录: $OPENCLAW_SKILLS_DIR"
}

install_skill() {
    local target_dir="$OPENCLAW_SKILLS_DIR/$SKILL_NAME"
    
    print_info "安装 skill 到 $target_dir..."
    
    # Check if already exists
    if [ -d "$target_dir" ]; then
        print_warning "Skill 已存在，将更新..."
        rm -rf "$target_dir"
    fi
    
    # If running from git repo, copy current directory
    if [ -f "./SKILL.md" ] && [ -f "./install.sh" ]; then
        print_info "从本地目录安装..."
        cp -r . "$target_dir"
    else
        # Clone from GitHub
        print_info "从 GitHub 克隆..."
        git clone --depth 1 "$REPO_URL.git" "$target_dir"
    fi
    
    # Clean up unnecessary files
    rm -rf "$target_dir/.git"
    rm -f "$target_dir/x-algorithm-explorer.zip"
    
    print_success "Skill 安装完成！"
}

verify_installation() {
    print_info "验证安装..."
    
    local target_dir="$OPENCLAW_SKILLS_DIR/$SKILL_NAME"
    
    if [ -f "$target_dir/SKILL.md" ]; then
        print_success "SKILL.md 存在"
    else
        print_error "SKILL.md 缺失"
        exit 1
    fi
    
    if [ -d "$target_dir/references" ]; then
        print_success "references/ 目录存在"
    else
        print_error "references/ 目录缺失"
        exit 1
    fi
    
    print_success "安装验证通过！"
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
    echo "  2. 直接提问:"
    echo "     • '解释一下 X 推荐算法'"
    echo "     • 'SimClusters 是什么？'"
    echo "     • 'For You Timeline 怎么工作的？'"
    echo ""
    echo "卸载方法:"
    echo "  rm -rf $OPENCLAW_SKILLS_DIR/$SKILL_NAME"
    echo ""
    echo "更多信息:"
    echo "  GitHub: $REPO_URL"
    echo "  文档: $REPO_URL#readme"
    echo ""
}

# Main
main() {
    print_banner
    
    check_openclaw
    install_skill
    verify_installation
    show_usage
}

main "$@"
