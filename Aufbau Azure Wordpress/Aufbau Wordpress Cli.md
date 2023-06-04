Als erstes müssen wir für den Dienst ein Gruppe erstellen. Dies die Umgebung einfach mit einem Script aufgebaut und zerstört werden kann.


  
```
az group create -l switzerlandnorth -n azwpmo-appservice
```
mit diesem erstellen wir einen App service plan der auf Linux basiert
```
az appservice plan create -g azwpmo-appservice -n azwpmo-appservice-plan  --is-linux -l switzerlandnorth --sku F1
```

### Azure DB for MYSQL Erstellen

Dies erstellt eine MYSQL Instanz mit einem Admin Account der ein definiertes Passwort hat
```
az mysql server create -g azwpmo-appservice -n azwpmo-mysql  --admin-user wpadmin --admin-password "J9!3EklqIl1-LS,am3f" -l switzerlandnorth  --ssl-enforcement Disabled --sku-name B_Gen5_1 --version 5.7
```

#### MySQL DB Firewall Konfigurieren

Hier werden für die MySQL Datenbank die Firewall konfiguiert so dass der App Service der wir voher Konfiguriert hatt Zugriff darauf Erlaubt
```
az mysql server firewall-rule create -g azwpmo-appservice --server azwpmo-mysql --name AllowAppService --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0
```

#### MySQL DB Wordpress Erstellen

Hier wird nun die DB für Wordpress erstellt
```
az mysql db create --resource-group azwpmo-appservice --server-name azwpmo-mysql --name azwpmo-wpdb
```

### Web App erstellen


```
az webapp create -n lucn-azwmo -g azwpmo-appservice -p azwpmo-appservice-plan -i "wordpress"
```

#### Web App DB Verbinden

```
$Find_DBHostName = (az mysql server show -g azwpmo-appservice -n azwpmo-mysql --query "FullyQualifiedDomainName" -o tsv)

az webapp config appsettings set -n WPAppName -g azwpmo-appservice --settings WORDPRESS_DB_HOST=$Find_DBHostName 
WORDPRESS_DB_USER="wpadmin@azwpmo-mysql" 
WORDPRESS_DB_PASSWORD="J9!3EklqIl1-LS,am3f"
```


```
az webapp config appsettings set -n lucn-azwmo -g azwpmo-appservice --settings WORDPRESS_DB_HOST= azwpmo-mysql.mysql.database.azure.com WORDPRESS_DB_USER="wpadmin@azwpmo-mysql.mysql.database.azure.com" WORDPRESS_DB_PASSWORD="J9!3EklqIl1-LS,am3f"
```




### Aufräumen

```
az group delete --name azwpmo-appservice --yes --no-wait
```


