# Automating PgSQL Database Maintenaince and Backup

This recipe is 99% based on the [Scott Gilbertson \(Luxagraf\) post](https://luxagraf.net/src/automatic-offsite-postgresql-backups)

### What it does?
+ Creates a compressed PgSQL daily backup, for every DB, if it as no change;

### What it doesn't?
* Coffee

### Steps

1. Create an someting_to_remember.sh (you can name it whatever you want) on the machine DB with the following:
```bash
#!/bin/bash
#
# Daily PostgreSQL maintenance: vacuuming and backuping.
#
##
set -e
for DB in $(psql -l -t -U your_user -hlocalhost |awk '{ print $1}' |grep -vE '^-|:|^List|^Name|template[0|1]|postgres|\|'); do
  echo "[`date`] Maintaining $DB"
  echo 'VACUUM' | psql -U your_user -hlocalhost -d $DB
  DUMP="/path/to/backup/dir/$DB.`date '+%Y%m%d'`.sql.gz"
  pg_dump -U your_user -hlocalhost $DB | gzip -c > $DUMP
  PREV="$DB.`date -d'1 day ago' '+%Y%m%d'`.sql.gz"
  md5sum -b $DUMP > $DUMP.md5
  if [ -f $PREV.md5 ] && diff $PREV.md5 $DUMP.md5; then
    rm $DUMP $DUMP.md5
  fi
done
```

  1.2. You should change *your_user* with your actual user and also */path/to/backup/dir/*;

2. Make the something_to_remember.sh executable, with:
```bash
chmod u+x something_to_remember.sh
```

3. you can test it, by running:
```bash
./someting_to_remember.sh
```

4. **Cron** time...to define at hours the script runs
```bash
crontab -e
```

  4.1. Add the line to the end of the file
  ```bash
  00 7 * * * cd /home/myuser/ && ./something_to_remember.sh > i_watch.log
 ```
 So it means that at 7:00 a.m., it will navigate to your home directory and run the script and write the log, more info about configuring cron https://crontab.guru/

5. We need a username & password, so create a .pgpass file (what is it? who should [go here for more info](https://www.postgresql.org/docs/current/auth-methods.html)) with user on the home directory with the following:
```bash
hostname:port:username:password
```
  it should look something like this, in the end
```bash
localhost:*:*:your_username:your_password
```
  5.1. change the permissions of the file
  ```bash
  chmod 600 .pgpass
  ```
6. make coffee
