#!/usr/bin/env bash
# ============================================================
# تصدير نسخة ثابتة (Static) من منصة سند
# الناتج: مجلد out/ — يُرفع على أي استضافة ثابتة مجانية
# الاستخدام: bash scripts-export-static.sh
# ============================================================
set -e
cd "$(dirname "$0")"

echo "→ إخفاء API مؤقتًا (لا يدعم التصدير الثابت)..."
mv app/api /tmp/sanad-api-backup 2>/dev/null || true

echo "→ بناء النسخة الثابتة..."
STATIC_EXPORT=1 npx next build

echo "→ استعادة API..."
mv /tmp/sanad-api-backup app/api 2>/dev/null || true

echo "✅ جاهز: مجلد out/"
du -sh out
