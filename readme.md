Readme

חברי הקבוצה: מיה יעקובי, עמית יחזקאל ותומר סודרי

מה נדרשנו לעשות?
בפרויקט נדרש להקים סביבה עםDocker , להתקין ולהגדיר Drupal ובסיס נתונים, לבצע גיבוי ושחזור של הנתונים, ולכתוב סקריפטים אוטומטיים לניהול התהליך.

מה עשינו?

•	יצירנו רשת Docker שתחבר את כל הקונטיינרים והתקנו בסיס הנתונים MySql ו-Drupal בתוך הקונטיינר באמצעות Docker 

•	ביצענו בדיקת ריצה לקונטיינרים, התחברנו לDrupal דרך הדפדפן וביצענו התקנה והגדרה, יצרנו חשבונות משתמשים לכל חברי הצוות

•	התחברנו לאתר שהקמנו והוספנו תכנים לאתר מתוך מילון המושגים שלמדנו בקורס

•	התקנו יישום גיבוי וביצענו גיבוי לבסיס הנתונים

•	בדקנו שכל הנתונים תקינים, שחזרנו את בסיס הנתונים ואתחלנו מחדש את הdrupal

•	יצרנו ארבעה סקריפטים:
setup.sh- מקים את תשתית הדוקר
backup.sh- מבצע גיבוי של בסיס הנתונים
restore.sh- מבצע שיחזור של כלל הנתונים 
cleanup.sh- מנקה את כל הקבצים שהוגדרו במערכת ומשאיר את סביבת העבודה כמו שהייתה לפני שהתחלנו

באיזה טכנולוגיות השתמשנו?

•	Docker  - לניהול קונטיינרים ולהרצת MySQL ו-Drupal בסביבה מבודדת

•	 MySQL - בסיס נתונים עבור  Drupal 

•	Drupal - ניהול תוכן ובניית האתר

•	Bash Scripting- כתיבת סקריפטים בשפת Bash (שפה לניהול והפעלה של פקודות במערכות Linux)

•	GitHub - לניהול קוד, גיבויים ושיתוף הפרויקט

•	Linux Commands – פקודות לניהול הסביבה, התקנות, והרצת Docker



מדריך step by step לביצוע השחזור:

שלב 1 – העתקת הקודים מהGitHub-
יצירת עותק מקומי של מאגר קוד (repository) שנמצא בשרת מרוחק בGitHub
על ידי הפקודה:
git clone https://github.com/TomerSudri/work_developmenttools.git 

שלב 2 – מתן הרשאות לסקריפטים-
הענקת הרשאות הרצה לסקריפטים על ידי הפקודה:
chmod +x setup.sh backup.sh restore.sh cleanup.sh

שלב 3 - הקמת סביבת עבודה-
על מנת להקים את סביבת העבודה יש להפעיל את הסקריפט הבא על ידי הפקודה ./setup.sh
סקריפט setup.sh אשר מבצע-
- בדיקת רשת Docker: אם הרשת drupal-network לא קיימת, ניצור אותה.
- הרצת MySQL: מפעילים קונטיינר MySQL וממתינים להפעלתו.
- הרצת Drupal: מפעילים קונטיינר Drupal וממתינים להפעלתו.
- בדיקת קונטיינרים פעילים: לוודא שכל הקונטיינרים עובדים כמצופה.

שלב 4 - קונפיגורציה של Drupal-
קביעת ההגדרות של  Drupal
לפתוח דפדפן ולנווט לכתובת: http://localhost:8080 
יש לבצע את שלבי ההתקנה של Drupal: 
•	בחירת שפה- עברית/אנגלית
•	בחירת פרופיל התקנה- standart
•	הגדרה של חיבור בסיס הנתונים-
       סוג מסד הנתונים- MySQL
       שם מסד הנתונים- my_database
       שם המשתמש במסד הנתונים- root
       סיסמת מסד הנתונים- my-secret-pw
       שם שרת- mysql-container
       מספר פורט- 3306
•	הגדרת שם האתר
•	יצירת חשבון מנהל לאתר עם שם המשתמש demoadmin והסיסמה secretpass.
•	ליצור חשבונות נוספים לשאר חברי הצוות במידת הצורך


שלב 5 - הוספת תוכן ועיצוב האתר
יש להוסיף תכנים לאתר ולעצבו

שלב 6 - ביצוע גיבוי של המידע ובסיס הנתונים-
להפעלת תהליך הגיבוי יש להריץ את הסקריפט הבא על ידי הפקודה   ./backup.sh
סקריפט backup.sh יוצר קובץ גיבוי בשם my-drupal-backup.sql.gz ושם אותו בתיקיה 
HOME/backup

שלב 7 - שחזור הגיבוי בסיס הנתונים-
יש להתקין את הסביבה העבודה במכונת linux אחרת באמצעות הפקודה ./setup.sh
יש להעתיק את קבצי הגיבוי למכונה ממנה מתבצע השחזור תחת התיקיה HOME/backup
על מנת לבצע את תהליך השחזור יש להריץ את הסקריפט הבא על ידי הפקודה ./restore.sh
סקריפט restore.sh משחזר מהגיבוי את הנתונים של האתר ואת בסיס הנתונים.

שלב 8 – ניקוי סביבת העבודה-
על מנת לנקות את סביבת העבודה נריץ את הסקריפט הבא על ידי הפקודה ./cleanup.sh
סקריפט  cleanup.shמנקה את כל הקבצים שהוגדרו במערכת עבור הפרויקט ומשאיר את סביבת העבודה כמו שהייתה לפני שהתחלנו את הכל.










פקודה אחר פקודה עם הסבר:

Setup.sh:
הסבר לסקריפט הקמת סביבת Docker 
1.	הקמת סביבת Docker 
    echo "הקמת סביבת  docker"
    מציג הודעה על תחילת התהליך

2.	בדיקה אם רשת Docker בשם drupal-network קיימת
    docker network ls | grep -w drupal-network > /dev/null
o	מציג את כל הרשתות הקיימות
o	מחפש רשת בשם  "drupal-network" 
o	> /dev/null מסתיר את הפלט כדי לא להציג אותו

3.	יצירת הרשת אם היא לא קיימת
    if [ $? -ne 0 ]; then
o	בודק אם הרשת לא קיימת(-ne 0), אם כן ממשיך ליצירתה
    docker network create drupal-network
o	יוצר רשת בשם drupal-network 
    else echo "הרשת קיימת"
o	אם הרשת כבר קיימת מציג הודעה

4.	הפעלת קונטיינר של MySQL
    docker run --name mysql-container --network=drupal-network -e MYSQL_ROOT_PASSWORD=my-secret-pw -d -p 3306:3306 mysql:latest
o	מפעיל קונטיינר של MySQL בשם mysql-container 
o	מחבר אותו לרשת drupal-network 
o	מגדיר סיסמת root (-e MYSQL_ROOT_PASSWORD=my-secret-pw) 
o	מריץ אותו ברקע (-d) 
o	ממפה את פורט 3306 של הקונטיינר לפורט 3306 של השרת

5.	המתנה לפעולת MySQL
    sleep 10
o	ממתין 10 שניות לוודא שהשירות עלה

6.	הפעלת קונטיינר של Drupal
    docker run --name drupal-container --network=drupal-network -d -p 8080:80 drupal:latest
o	מפעיל קונטיינר של Drupal בשם drupal-container.
o	מחבר אותו לרשת drupal-network
o	מריץ אותו ברקע (-d) 
o	ממפה את פורט 80 של הקונטיינר לפורט 8080 של השרת

7.	המתנה לפעולת Drupal
    sleep 10
o	ממתין 10 שניות כדי לוודא שהשירות עלה

8.	יצירת מסד נתונים ב-MySQL
    docker exec mysql-container sh -c "exec mysqladmin -uroot -pmy-secret-pw create my_database"
o	נכנס לקונטיינר של  MySQL 
o	יוצר מסד נתונים בשם my_database

9.	עצירה והפעלה מחדש של Drupal
    docker stop drupal-container
o	עוצר את הקונטיינר של  Drupal 
    sleep 10
o	ממתין 10 שניות
    docker start drupal-container
o	מפעיל מחדש את הקונטיינר
    sleep 10
o	ממתין 10 שניות

10.	בדיקת קונטיינרים רצים
    docker ps
o	מציג את הקונטיינרים שרצים כרגע

11.	סיום התהליך
    echo "הסביבה הוקמה בהצלחה"
o	מציג הודעה שהתהליך הושלם בהצלחה



 

Backup.sh:
1.	#!/bin/bash
    מציין שהסקריפט ירוץ עם שרת הבאש

2.	echo " מתחיל תהליך גיבוי מסד הנתונים"
    מציג הודעה למסך שמודיעה על התחלת תהליך הגיבוי


3.	BACKUP_DIR="$HOME/backup"
    מגדיר את המשתנה BACKUP_DIR  להיות נתיב לתיקיית הגיבוי (בתוך התיקיה הביתית של המשתמש)

4.	BACKUP_FILE="$BACKUP_DIR/my-drupal-backup.sql.gz"
    מגדיר את המשתנה BACKUP_FILE  להיות הנתיב המלא של קובץ הגיבוי (הקובץ יהיה בארכיון gz).

5.	if [ ! -d "$BACKUP_DIR" ]; then
    בודק אם התיקיה המוגדרת ב-$BACKUP_DIR לא קיימת

6.	echo  "יוצר תיקיית גיבוי ב$BACKUP_DIR  "
    אם התיקיה לא קיימת, מציג הודעה על יצירת תיקיית גיבוי

7.	mkdir -p "$HOME/backup"
    יוצר את תיקיית הגיבוי אם היא לא קיימת (האפשרות -p מבטיחה שהיא תיווצר גם אם הורים שלה לא קיימים)

8.	fi
    סוגר את בלוק ה-if.

9.	echo  "מבצע גיבוי של בסיס הנתוניםdrupal  "
    מציג הודעה שמצביעה על תחילת תהליך הגיבוי של מסד הנתונים

10.	docker exec mysql-container sh -c 'exec mysqldump --all-databases -uroot -pmy-secret-pw' | gzip > "$BACKUP_FILE"
    מבצע את הפקודה הבאה בתוך קונטיינר דוקר:
o	פקודת docker exec mysql-container  מריצה פקודה בתוך קונטיינר בשם mysql-container
o	הפקודה sh -c 'exec mysqldump --all-databases -uroot -pmy-secret-pw'  מריצה את mysqldump  על כל מסדי הנתונים ב-MySQLעם שם משתמש root  וסיסמא my-secret-pw
o	התוצאה מנותחת עם gzip (כדי לדחוס את הנתונים) ונשמרת בקובץ שהוגדר ב-$BACKUP_FILE

11.	if [ $? -eq 0 ]; then
    בודק אם הפקודה הקודמת הצליחה ($? מחזיר את מצב יציאה של הפקודה האחרונה, כאשר 0 מציין הצלחה

12.	echo   "הגיבוי נשמר בהצלחה ב$BACKUP_FILE ":
    אם הפקודה הצליחה, מציג הודעה עם הצלחה ומציין את מיקום הקובץ

13.	else
    אם הפקודה לא הצליחה, מבצע את החלק הבא

14.	echo   "שגיאה בגיבוי הנתונים!"
    מציג הודעה על שגיאה בתהליך הגיבוי

15.	exit 1
    עוצר את הסקריפט עם קוד יציאה 

16.	fi
    סוגר את בלוק ה-if

17.	echo "תהליך הגיבוי הסתיים בהצלחה"
    אם כל התהליך עבר בהצלחה, מציג הודעה על סיום הגיבוי בהצלחה

 



Restore.sh:
הסבר לסקריפט שחזור גיבוי ב-Docker
1.	הגדרת שם קובץ הגיבוי האחרון
    LATEST_BACKUP="my-drupal-backup.sql.gz"
o	משתנה המכיל את שם קובץ הגיבוי לשחזור

2.	בדיקה אם קובץ הגיבוי קיים
    if [ ! -f "$LATEST_BACKUP" ]; then
o	בודק אם הקובץ לא קיים (! -f) 

3.	אם הקובץ לא נמצא
    echo  "לא נמצא קובץ גיבוי לשחזור ב$BACKUP_DIR "-
o	מציג הודעה שהגיבוי לא נמצא
    exit 1
o	יוצא מהסקריפט עם קוד שגיאה (1).

4.	שחזור הגיבוי
    echo  "שחזור הגיבוי האחרון  $LATEST_BACKUP":
o	מציג הודעה שהשחזור מתחיל

5.	ביצוע שחזור המסד נתונים
    gunzip < "$LATEST_BACKUP" | docker exec -i mysql-container sh -c "exec mysql -h 127.0.0.1 -uroot -pmy-secret-pw --force my_database"
o	gunzip < "$LATEST_BACKUP"  
    מחלץ את תוכן קובץ הגיבוי הדחוס (.gz).
o	מעביר את הפלט לפקודת docker exec 
o	 docker exec -i mysql-container sh -c ... 
    מריץ פקודה בתוך קונטיינר MySQL
o	exec mysql -h 127.0.0.1 -uroot -pmy-secret-pw --force my_database 
 	מתחבר למסד הנתונים my_database
	משתמש בשם משתמש  root והסיסמה my-secret-pw
	 -force מבטיח שהשחזור ימשיך גם אם יהיו שגיאות





Cleanup.sh:
הסבר לסקריפט ניקוי סביבה ב-Docker
1.	הגדרת משתנים
    NETWORK="drupal-network"
o	משתנה המייצג את שם הרשת של Docker 
    MYSQL_CONTAINER="mysql-container"
o	משתנה המייצג את שם הקונטיינר של MySQL 
    DRUPAL_CONTAINER="drupal-container"
o	משתנה המייצג את שם הקונטיינר של Drupal 

2.	הודעה על תחילת התהליך
    echo  "מתחיל ניקוי של הקבצים שהוגדרו"
o	מציג הודעה על תחילת תהליך הניקוי

3.	עצירה ומחיקה של קונטיינר Drupal
    echo "עוצר ומוחק את קונטיינר  Drupal"
o	מציג הודעה לפני ביצוע הפעולות
    docker stop $DRUPAL_CONTAINER 2>/dev/null || true
o	עוצר את הקונטיינר אם הוא קיים
o	2>/dev/null  מסתיר הודעות שגיאה במקרה שהקונטיינר לא קיים
o	 || true מונע מהסקריפט להיכשל במקרה של שגיאה
    docker rm $DRUPAL_CONTAINER 2>/dev/null || true
o	מוחק את הקונטיינר של Drupal 

4.	עצירה ומחיקה של קונטיינר MySQL
    echo "עוצר ומוחק את קונטיינר MySQL"
o	מציג הודעה לפני ביצוע הפעולות
    docker stop $MYSQL_CONTAINER 2>/dev/null || true
o	עוצר את הקונטיינר של MySQL אם הוא קיים
    docker rm $MYSQL_CONTAINER 2>/dev/null || true
o	מוחק את הקונטיינר של MySQL 

5.	מחיקת רשת Docker
    echo "מוחק את רשת  Docker"
o	מציג הודעה לפני מחיקת הרשת
    docker network rm $NETWORK 2>/dev/null || true
o	מוחק את הרשת  drupal-network אם היא קיימת
o	 2>/dev/null מסתיר שגיאות אם הרשת לא קיימת
o	 || true מבטיח שהסקריפט ימשיך לפעול גם אם הרשת אינה קיימת

6.	הודעה על סיום התהליך
    echo   "תהליך הניקוי הסתיים"
o	מציג הודעה שהתהליך הסתיים בהצלחה
