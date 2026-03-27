#!/bin/bash
# X Viral Engine - Package Script
# Creates a .skill file for distribution

set -e

SKILL_NAME="x-viral-engine"
SKILL_VERSION="3.0.0"
OUTPUT_FILE="${SKILL_NAME}-${SKILL_VERSION}.skill"

echo "═══════════════════════════════════════════════════"
echo "📦 X Viral Engine Skill Packager"
echo "Version: ${SKILL_VERSION}"
echo "═══════════════════════════════════════════════════"
echo ""

if [ ! -f "SKILL.md" ]; then
    echo "❌ Error: SKILL.md not found"
    exit 1
fi

echo "📁 Packaging files..."

zip -r "${OUTPUT_FILE}" \
    SKILL.md \
    README.md \
    install.sh \
    package.sh \
    references/ \
    templates/ \
    examples/ \
    -x "*.git*" \
    -x "*.zip" \
    -x "*.skill" \
    -x "publish.sh"

echo ""
echo "✅ Package created: ${OUTPUT_FILE}"
echo ""
echo "Size: $(ls -lh ${OUTPUT_FILE} | awk '{print $5}')"
echo ""
echo "Usage:"
echo "  openclaw skills install ${OUTPUT_FILE}"
echo ""
