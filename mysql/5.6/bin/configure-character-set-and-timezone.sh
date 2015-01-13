if [ -z "$(ls -A /var/lib/mysql)" -a "${1%_safe}" = 'mysqld' ]; then
    if [ "x$MYSQL_CHARACTER_SET" != "x" ]; then
        sed -i "s/^\\( *character_set_server\\) *= *.*/\\1 = ${MYSQL_CHARACTER_SET}/" /etc/mysql/conf.d/characterset.cnf
        sed -i "s/^\\( *default-character-set\\) *= *.*/\\1 = ${MYSQL_CHARACTER_SET}/" /etc/mysql/conf.d/characterset.cnf
    fi

    if [ "x$TZ" != "x" ]; then
        echo "$TZ" > /etc/timezone
        dpkg-reconfigure -f noninteractive tzdata
    fi
fi