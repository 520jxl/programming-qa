#!/bin/bash
# save-from-queue.sh — Stop hook 处理器：从队列文件读取并保存 Q&A
QUEUE_FILE="/c/Users/18352/programming-qa/.pending-save.jsonl"
SAVE_SCRIPT="/c/Users/18352/programming-qa/save-qa.sh"

if [ ! -f "$QUEUE_FILE" ]; then
    exit 0
fi

saved=0
while IFS= read -r line; do
    [ -z "$line" ] && continue
    title=$(echo "$line" | python3 -c "import sys,json; print(json.loads(sys.stdin.read()).get('title','untitled'))" 2>/dev/null)
    question=$(echo "$line" | python3 -c "import sys,json; print(json.loads(sys.stdin.read()).get('question',''))" 2>/dev/null)
    answer=$(echo "$line" | python3 -c "import sys,json; print(json.loads(sys.stdin.read()).get('answer',''))" 2>/dev/null)
    tags=$(echo "$line" | python3 -c "import sys,json; print(json.loads(sys.stdin.read()).get('tags','general'))" 2>/dev/null)

    if [ -n "$title" ] && [ -n "$answer" ]; then
        bash "$SAVE_SCRIPT" "$title" "$question" "$answer" "$tags"
        saved=$((saved + 1))
    fi
done < "$QUEUE_FILE"

# 清空队列
> "$QUEUE_FILE"

echo "Auto-saved $saved Q&A entries."

# 自动推送到 GitHub
if [ "$saved" -gt 0 ]; then
  git push origin master 2>/dev/null && echo "Pushed to GitHub." || true
fi
