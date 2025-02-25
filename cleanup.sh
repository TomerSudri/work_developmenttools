echo "🚀 מתחיל ניקוי של הקבצים שהוגדרו..."

BACKUP_DIR="/backup"

echo "🔹 מוחק את כל קבצי הגיבוי בתיקייה $BACKUP_DIR..."
rm -rf $BACKUP_DIR/*

if [ $? -eq 0 ]; then
    echo "✅ כל קבצי הגיבוי נמחקו בהצלחה!"
else
    echo "❌ שגיאה בניקוי הקבצים!"
    exit 1
fi

echo "🎉 תהליך הניקוי הסתיים!"
