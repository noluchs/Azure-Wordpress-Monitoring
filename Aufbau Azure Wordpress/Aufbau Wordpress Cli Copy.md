Als erstes müssen wir für den Dienst ein Gruppe erstellen 


  
```
az group create -l switzerlandnorth -n azwpmo-appservice
```
mit diesem erstellen wir einne App service plan
```
az appservice plan create -g azwpmo-appservice -n azwpmo-appservice-plan  --is-linux -l switzerlandnorth --sku F1
```

### Azure DB for MYSQL Erstellen

```
az mysql server create -g azwpmo-appservice -n azwpmo-mysql  --admin-user wpadmin --admin-password "J9!3EklqIl1-LS,am3f" -l switzerlandnorth  --ssl-enforcement Disabled --sku-name B_Gen5_1 --version 5.7
```

#### MySQL DB Firewall Konfigurieren
```
az mysql server firewall-rule create -g azwpmo-appservice --server azwpmo-mysql --name AllowAppService --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0
```

#### MySQL DB Wordpress Erstellen
```
az mysql db create --resource-group azwpmo-appservice --server-name azwpmo-mysql --name azwpmo-wpdb
```

### Web App erstellen

```
azwp
```


### Aufräumen

```
az group delete --name azwpmo-appservice --yes --no-wait
```