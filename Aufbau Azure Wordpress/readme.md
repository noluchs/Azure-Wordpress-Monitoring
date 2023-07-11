# Aufbau AppService WordPress MySQL Cli

Hier wird die ganze WordPress und Datenbank Umgebung aufgebaut und . Dies wird über Azure CLI gemacht. Falls man die ganze Umgebung mit einem Script installieren möchte, kann dies verwendet werden: [Script Azure CLI WordPress](Script/Azure-CLI-WordPress.sh). Danach werden von der alten Umgebung die Daten übertragen zu Azure.

[Azure Wordpress initialisieren](##Aufbau)
[Wordpress Migration](##Migration)

## Aufbau
### Azure Ressource Gruppe erstellen

Hier erstellen wir die Gruppe, wo dann alle Ressourcen hinzugefügt werden.
```
az group create -l switzerlandnorth -n azwpmo-appservice
```

### App Service Plan Erstellen

 Erstellen wir einen AppService Plan, der auf Linux basiert. Für unsere Instanz nehmen wir das Pricing level B1. Und die Region Switzerland North
```
az appservice plan create -g azwpmo-appservice -n azwpmo-appservice-plan  --is-linux -l switzerlandnorth --sku B1
```

### Container mit WordPress erstellen
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

### Netzwerk


### Virtuelles Netzwerk erstellen

Dies erstellt ein vnet mit dem Adres berech von 10.0.0.0/16
```
az network vnet create \   
--name lucn-wordpress \   
--resource-group azwpmo-appservice \   
--address-prefixes 10.0.0.0/16
```

### Subnetz für AppService erstellen

Hier erstellen wir ein Subnetzwerk für den AppService mit dem Range 10.0.1.0/24 
```
az network vnet subnet create \   
--name appService \   
--resource-group azwpmo-appservice \ 
--vnet-name lucn-wordpress \   
--address-prefixes 10.0.1.0/24 
```

### Subnetz für database erstellen

Hier erstellen wir ein Subnetzwerk für die MySQL Instanzen mit dem Range 10.0.2.0/24 
```
az network vnet subnet create \
--name database \
--resource-group azwpmo-appservice \
--vnet-name lucn-wordpress \
--address-prefixes 10.0.2.0/24 
```

### Subnetze mit Azure Service verbinden

Hier verbinden wir das Subnetzwerk appService mit den Azure Web Services
```
az network vnet subnet update \
--name appService \
--vnet-name lucn-wordpress \
--resource-group azwpmo-appservice \
--delegations Microsoft.Web/serverFarms 
```


Hier verbinden wir das Subnetzwerk Database mit dem MySQL Server
```
az network vnet subnet update \
--name database \ 
--vnet-name lucn-wordpress \
--resource-group azwpmo-appservice \
--delegations Microsoft.DBforMySQL/servers
```


#### WordPress mit DB verbinden

Hier werden die DB Informationen bei dem AppService in der Wordpress instanz von der DB hinterlegt.

```
az webapp config appsettings set -n lucn-azwmo -g azwpmo-appservice --settings \ WORDPRESS_DB_HOST= azwpmo-mysql.mysql.database.azure.com \
WORDPRESS_DB_USER="wpadmin@azwpmo-mysql" \ 
WORDPRESS_DB_PASSWORD="J9!3EklqIl1-LS,am3f"
```


### WordPress Initialisieren


Hier wird nun WordPress fertig eingerichtet, hierfür muss man auf die Domaine gehen die einem Azure zu verfügung gibt und muss noch diverses zur Webseite wie Name und Login Daten angeben. Danach wird die Seite initlisiert.

Login 
Username: w4s_noah
Password: Lq8LvRWW3fDvGO0TTK

![](attachments/Pasted%20image%2020230711110458.png)
![](attachments/Pasted%20image%2020230711111246.png)



## Migration
#### Backup Machen

Hier machen wir bei der alten Umgebung eine Sicherung mithilfe des Plugin [Backup Migration](https://backupbliss.com/)damit wir danach dies auf der Azure Umgebung einspielen können.
![](attachments/Pasted%20image%2020230711224731.png)

![](attachments/Pasted%20image%2020230711224834.png)









#### Backup Einspielen

Auf der Azure Umggeubung im Wordpress das Plugin [Backup Migration](https://backupbliss.com/) installieren und dann unter Manage & restore Backups die Sicherung zurückspielen

![](attachments/Pasted%20image%2020230711225235.png)

Dies geht einen moment aber danach sollte der Inhalt übertagen sein.

![](attachments/Pasted%20image%2020230711225248.png)

Nun läuft die Seite bei Azure

![](attachments/Pasted%20image%2020230711230718.png)









### Verbinden App Service DB
![](attachments/Pasted%20image%2020230705215022.png)
![](attachments/Pasted%20image%2020230705215038.png)
![](attachments/Pasted%20image%2020230711104806.png)


### Aufräumen

```
az group delete --name azwpmo-appservice --yes --no-wait
```


