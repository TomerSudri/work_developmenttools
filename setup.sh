#!/bin/bash

echo "הקמת סביבת docker"

docker network ls | grep -w drupal-network > /dev/null
if [ $? -ne 0 ]; then
    echo "יצירת רשת בשם drupal-network"
    docker network create drupal-network
else
    echo "הרשת קיימת"
fi

echo "מפעיל container"
docker run --name mysql-container --network=drupal-network -e MYSQL_ROOT_PASSWORD=my-secret-pw -d -p 3306:3306 mysql:latest

echo "⏳ מחכה ש-MySQL יתחיל לפעול..."
sleep 10

echo "מפעיל container"
docker run --name drupal-container --network=drupal-network -d -p 8080:80 drupal:latest

echo "⏳ מחכה ש-Drupal יתחיל לפעול..."
sleep 10

docker exec mysql-container sh -c "exec mysqladmin -uroot -pmy-secret-pw create my_database"

docker stop drupal-container
sleep 10

docker start drupal-container
sleep 10

echo "בדיקת containrs"
docker ps

echo "הסביבה הוקמה בהצלחה"
