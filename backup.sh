#!/bin/bash

echo " מתחיל תהליך גיבוי מסד הנתונים"

BACKUP_DIR="$HOME/backup"
BACKUP_FILE="$BACKUP_DIR/my-drupal-backup.sql.gz"

if [ ! -d "$BACKUP_DIR" ]; then
    echo " יוצר תיקיית גיבוי ב-$BACKUP_DIR"
    mkdir -p "$HOME/backup"
fi

echo "🔹 מבצע גיבוי של בסיס הנתונים drupal..."
docker exec mysql-container sh -c 'exec mysqldump --all-databases -uroot -pmy-secret-pw' | gzip > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "✅ הגיבוי נשמר בהצלחה ב: $BACKUP_FILE"
else
    echo "❌ שגיאה בגיבוי הנתונים!"
    exit 1
fi

echo "תהליך הגיבוי הסתיים בהצלחה"
