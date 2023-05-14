Als erstes müssen wir für den Dienst ein Gruppe erstellen 
  
```
az group create -l switzerlandnorth -n azwpmo-appservice
```
mit diesem erstellen wir einne App service plan
```
az appservice plan create -g azwpmo-appservice -n azwpmo-appservice-plan  --is-linux -l switzerlandnorth --sku F1
```

### Azure DB for MYSQL

```
az mysql server create -g azwpmo-appservice -n azwpmo-mysql  --admin-user wpadmin --admin-password J9!3EklqIl1-LS,am3f -l switzerlandnorth  --ssl-enforcement Disabled ` --sku-name GP_Gen5_2 --version 5.7
```

### Web App erstellen


```
az appservice plan create -g azwpmo-appservice -n azwpmo-appservice-plan  --is-linux -l switzerlandnorth --sku F1
```