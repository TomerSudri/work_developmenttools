#! /bin/bash
LATEST_BACKUP="my-drupal-backup.sql.gz"

if [ ! -f "$LATEST_BACKUP" ]; then
    echo "❌ לא נמצא קובץ גיבוי לשחזור ב-$BACKUP_DIR"
    exit 1
fi

echo "🔹 שחזור הגיבוי האחרון: $LATEST_BACKUP"
gunzip < "$LATEST_BACKUP" | docker exec -i mysql-container sh -c "exec mysql -h 127.0.0.1 -uroot -pmy-secret-pw --force my_database"