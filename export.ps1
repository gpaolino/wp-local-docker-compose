# Imposta la data corrente
$_now = Get-Date -Format "MM_dd_yyyy"
$_file = "wp-data/data_$($_now).sql"

# Comando di esportazione
$EXPORT_COMMAND = 'exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"'

# Esegui il dump del database
docker-compose exec db sh -c $EXPORT_COMMAND > $_file

# Rimuovi l'avviso della password dal file
if ($IsMacOS) {
    (Get-Content $_file) | Select-Object -Skip 1 | Set-Content $_file
} else {
    (Get-Content $_file) | Select-Object -Skip 1 | Set-Content $_file
}
