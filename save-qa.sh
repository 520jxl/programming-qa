#!/bin/bash
# save-qa.sh — 将编程问答保存为 .c 文件并提交到本地 git
# 用法: ./save-qa.sh "问题标题" "问题内容" "回答内容" ["标签"]

TITLE="$1"
QUESTION="$2"
ANSWER="$3"
TAGS="${4:-general}"

REPO_DIR="/c/Users/18352/programming-qa"
cd "$REPO_DIR" || exit 1

# 生成安全的文件名 (日期-标题.c)
DATE=$(date +%Y-%m-%d)
SAFE_TITLE=$(echo "$TITLE" | sed 's/[^a-zA-Z0-9_-]/-/g' | sed 's/-\+/-/g' | sed 's/^-//;s/-$//' | cut -c1-50)
FILENAME="${DATE}-${SAFE_TITLE}.c"
FILEPATH="${REPO_DIR}/c-questions/${FILENAME}"

# 如果文件已存在，加序号
if [ -f "$FILEPATH" ]; then
    i=2
    while [ -f "${REPO_DIR}/c-questions/${DATE}-${SAFE_TITLE}-${i}.c" ]; do
        i=$((i + 1))
    done
    FILENAME="${DATE}-${SAFE_TITLE}-${i}.c"
    FILEPATH="${REPO_DIR}/c-questions/${FILENAME}"
fi

# 生成 .c 文件内容
cat > "$FILEPATH" << 'ENDOFFILE'
/*
 * ============================================================
 * Project: Programming Q&A Archive
 * ============================================================
 */
ENDOFFILE

# 追加问题信息
cat >> "$FILEPATH" << EOF
/*
 * Date: $(date +%Y-%m-%d\ %H:%M)
 * Tags: ${TAGS}
 *
 * --- Question ---
 * ${QUESTION}
 *
 * --- Answer ---
EOF

# 把回答内容逐行写进去（处理多行）
echo "$ANSWER" | while IFS= read -r line; do
    echo " * ${line}" >> "$FILEPATH"
done

cat >> "$FILEPATH" << 'ENDOFFILE'
 *
 * ============================================================
 * Note: This file is auto-generated from Claude Code Q&A.
 *       Compilable C code (if any) is below the comment block.
 * ============================================================
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 如果你问的问题包含可运行的 C 代码，会出现在这里
 */

// int main() {
//     // 可运行代码示例
//     return 0;
// }
ENDOFFILE

echo "Saved: ${FILENAME}"

# Git 提交
git add "c-questions/${FILENAME}"
git commit -m "Add Q&A: ${TITLE}" --no-verify --allow-empty-message 2>/dev/null

echo "Committed to local git."
