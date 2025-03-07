
NETWORK="drupal-network"
MYSQL_CONTAINER="mysql-container"
DRUPAL_CONTAINER="drupal-container"

echo "מתחיל ניקוי של הקבצים שהוגדרו"

echo "עוצר ומוחק את קונטיינר Drupal"
docker stop $DRUPAL_CONTAINER 2>/dev/null || true
docker rm $DRUPAL_CONTAINER 2>/dev/null || true

echo "עוצר ומוחק את קונטיינר MySQL"
docker stop $MYSQL_CONTAINER 2>/dev/null || true
docker rm $MYSQL_CONTAINER 2>/dev/null || true

echo "מוחק את רשת Docker"
docker network rm $NETWORK 2>/dev/null || true

echo "🎉 תהליך הניקוי הסתיים"
