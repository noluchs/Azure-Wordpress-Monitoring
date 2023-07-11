# Aufbau AppService Wordpress MySQL Cli

Hier wird erklär wie die ganze WordPress und Datenbank Umgebung aufgebaut wird. Dies wird über Azure CLI gemacht. Falls man die ganze Umgebung mit einem Script installieren möchte, kann dies verwendet werden:![](Script/WordPressOnAzure.sh) 


### Azure Gruppe erstellen

```
az group create -l switzerlandnorth -n azwpmo-appservice
```

### App Service Plan Erstellen
mit diesem erstellen wir einen App-Service Plan, der auf Linux basiert. Für unsere Instanz nehmen wir das Pricinglevel B1. 
```
az appservice plan create -g azwpmo-appservice -n azwpmo-appservice-plan  --is-linux -l switzerlandnorth --sku B1
```

### Container mit Wordpress erstellen
jetzt müssen wir noch die Umgebung erstellen, dies ist 
```
az webapp create -n lucn-azwmo -g azwpmo-appservice -p azwpmo-appservice-plan -i "wordpress"
```

## Azure Database for MySQL


### Azure DB for MYSQL Erstellen

Dies erstellt eine MYSQL Instanz mit einem Admin Account, deren definiertes Passwort hat. Dazu wird die SSL Verschlüsslung deaktiviert, damit ohne Zertifikat auf die DB Zugegriffen werden kann.
```
az mysql server create -g azwpmo-appservice -n azwpmo-mysql  --admin-user wpadmin --admin-password "ayA05I92A@Jh1aq&RtiLQRwyU" -l switzerlandnorth  --ssl-enforcement Disabled --sku-name B_Gen5_1 --version 5.7
```

#### MySQL DB Firewall Konfigurieren

Hier werden für die MySQL Datenbank die Firewall konfiguriert, sodass der App Service, der wir vorher konfiguriert hat, Zugriff darauf erlaubt
```
az mysql server firewall-rule create -g azwpmo-appservice --server azwpmo-mysql --name AllowAppService --start-ip-address c --end-ip-address 0.0.0.0
```

#### MySQL DB WordPress Erstellen

Hier wird nun die Datenbank für WordPress erstellt
```
az mysql db create --resource-group azwpmo-appservice --server-name azwpmo-mysql --name wordpres
```

## Netzwerk


### Virtuelles Netzwerk erstellen

```
az network vnet create \   
--name lucn-wordpress \   
--resource-group azwpmo-appservice \   
--address-prefixes 10.0.0.0/16
```

### Subnetz für AppService erstellen


```
az network vnet subnet create \   
--name appService \   
--resource-group azwpmo-appservice \ 
--vnet-name lucn-wordpress \   
--address-prefixes 10.0.1.0/24 
```

### Subnetz für database erstellen

```
az network vnet subnet create \
--name database \
--resource-group azwpmo-appservice \
--vnet-name lucn-wordpress \
--address-prefixes 10.0.2.0/24 
```

### Delegate Subnets to azure services 

```
az network vnet subnet update \
--name appService \
--vnet-name lucn-wordpress \
--resource-group azwpmo-appservice \
--delegations Microsoft.Web/serverFarms 
az network vnet subnet update \
--name database \ 
--vnet-name lucn-wordpress \
--resource-group azwpmo-appservice \
--delegations Microsoft.DBforMySQL/servers
```


#### WordPress mit DB verbinden

Hier werden die DB Informationen bei dem AppService 

```
az webapp config appsettings set -n lucn-azwmo -g azwpmo-appservice --settings \ WORDPRESS_DB_HOST= azwpmo-mysql.mysql.database.azure.com \
WORDPRESS_DB_USER="wpadmin@azwpmo-mysql" \ 
WORDPRESS_DB_PASSWORD="J9!3EklqIl1-LS,am3f"
```


### WordPress Initialisieren

Login 
Username: w4s_noah
Password: Lq8LvRWW3fDvGO0TTK

![](attachments/Pasted%20image%2020230711110458.png)
![](attachments/Pasted%20image%2020230711111246.png)

### WordPress Migration
#### Backup Machen
![](attachments/Pasted%20image%2020230711121207.png)

![](attachments/Pasted%20image%2020230711121104.png)


![](attachments/Pasted%20image%2020230711121253.png)



#### Backup Einspielen

![](attachments/Pasted%20image%2020230711121342.png)

![](attachments/Pasted%20image%2020230711121402.png)















### Verbinden App Service DB
![](attachments/Pasted%20image%2020230705215022.png)
![](attachments/Pasted%20image%2020230705215038.png)
![](attachments/Pasted%20image%2020230711104806.png)
### Aufräumen

```
az group delete --name azwpmo-appservice --yes --no-wait
```


