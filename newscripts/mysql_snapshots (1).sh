#!/bin/sh

DIR=/opt/sql
USERNAME="userThatCanRead"
PASSWORD="Password"

rm $DIR/*.gz 2>&1 > /dev/null

DATABASES=$(echo "SHOW DATABASES" | mysql -u $USERNAME --pass=$PASSWORD | grep -v Database)

for DB in $DATABASES
do
        if ( [ "${DB}" != "information_schema" ] && [ ${DB} != "performance_schema" ] )
        then
                mysqldump -u $USERNAME --password=$PASSWORD -c --databases ${DB} > $DIR/${DB}.sql
                gzip $DIR/${DB}.sql
        fi
done

DAY=`date +%u`
if [ $DAY -eq '7' ]
then
        DX=`date +%Y%m%d`
        for DB in $DATABASES
        do
                if ( [ "${DB}" != "information_schema" ] && [ ${DB} != "performance_schema" ] )
                then
                        cp $DIR/${DB}.sql.gz $DIR/historical/${DB}-$DX.sql.gz
                fi
        done
fi