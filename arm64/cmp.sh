#!/bin/bash
# 对比 build24.sh 的 PACKAGES 与 24.10 manifest 的包名差异
set -u
BUILD="$(dirname "$0")/build24.sh"
MANIFEST="${1:-../m2410.txt}"

# 提取 PACKAGES 中所有包名
grep '^PACKAGES=' "$BUILD" \
  | sed 's/^PACKAGES="\$PACKAGES //; s/"$//' \
  | tr ' ' '\n' \
  | grep -v '^\$CUSTOM_PACKAGES$' \
  | grep -v '^$' \
  | sort -u > /tmp/wanted.txt

# 提取 manifest 包名（形如 "pkg - ver"）
awk '{print $1}' "$MANIFEST" | sort -u > /tmp/have.txt

echo "=== 需求包总数: $(wc -l < /tmp/wanted.txt) / manifest 包总数: $(wc -l < /tmp/have.txt) ==="
echo
echo "=== 在 24.10 manifest 中【找不到】的包（需要逐个处理） ==="
comm -23 /tmp/wanted.txt /tmp/have.txt
echo
echo "=== 数量 ==="
comm -23 /tmp/wanted.txt /tmp/have.txt | wc -l
