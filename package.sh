#!/bin/bash
# X Algorithm Explorer - Package Script
# Creates a .skill file for distribution

set -e

SKILL_NAME="x-algorithm-explorer"
SKILL_VERSION="2.0.0"
OUTPUT_FILE="${SKILL_NAME}-${SKILL_VERSION}.skill"

echo "═══════════════════════════════════════════════════"
echo "📦 X Algorithm Explorer Skill Packager"
echo "Version: ${SKILL_VERSION}"
echo "═══════════════════════════════════════════════════"
echo ""

# Check if we're in the right directory
if [ ! -f "SKILL.md" ]; then
    echo "❌ Error: SKILL.md not found"
    echo "Please run this script from the skill directory"
    exit 1
fi

echo "📁 Packaging files..."

# Create zip archive (excluding git and temp files)
zip -r "${OUTPUT_FILE}" \
    SKILL.md \
    README.md \
    install.sh \
    references/ \
    scripts/ \
    -x "*.git*" \
    -x "*.zip" \
    -x "publish.sh"

echo ""
echo "✅ Package created: ${OUTPUT_FILE}"
echo ""
echo "Size: $(ls -lh ${OUTPUT_FILE} | awk '{print $5}')"
echo ""
echo "Usage:"
echo "  1. Upload ${OUTPUT_FILE} to GitHub Releases"
echo "  2. Users can install with:"
echo "     openclaw skills install ${OUTPUT_FILE}"
echo ""
