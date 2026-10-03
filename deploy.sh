#!/bin/zsh
# Đẩy bản mới lên GitHub Pages: đóng dấu phiên bản vào index.html + version.json
# để trang đang mở trên máy người chơi hiện pill "Có bản mới".
set -e
cd "$(dirname "$0")"
V=$(date +%Y%m%d-%H%M%S)
sed -i '' -E "s/const APP_VERSION = \"[^\"]*\";/const APP_VERSION = \"$V\";/" index.html
printf '{"v":"%s"}\n' "$V" > version.json
git add -A
git commit -q -m "${1:-Cập nhật} ($V)

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
git push -q
echo "Đã đẩy phiên bản $V lên buitienson.github.io/doi-don-vi (Pages cần ~1 phút để cập nhật)"
