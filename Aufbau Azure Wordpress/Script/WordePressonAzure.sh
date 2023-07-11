#!/bin/bash

# Variablen
$resourceGroup=azwpmo-appservice
$location=switzerlandnorth

#App
$appName=lucn-azwmo
$appserviceplan=azwpmo-appservice-plan

#DB
$mysqlServerName=azwpmo-mysql
$mysqlUsername=wpadmin
$mysqlPassword=head -c 16 /dev/urandom | base64
$mysqlDBName=wordpres

#Netzwerk
$vnetwordpress=lucn-wordpress
$subnetwp=appService
$subnetdb=database

# Azure Resource Group erstellen

az group create -l $location -n $resourceGroup


# Azure App Service Plan ertsellen

az appservice plan create -g $resourceGroup -n $appserviceplan  --is-linux -l $location --sku B1

# Azure WebApp ertsellen

az webapp create -n $appName -g $resourceGroup -p $appserviceplan -i "wordpress"


# Azure Database für MySQL erstellen

az mysql server create -g $resourceGroup \
-n $mysqlServerName \
--admin-user $mysqlUsername \
--admin-password $mysqlPassword \
-l $location  \
--ssl-enforcement Disabled \
--sku-name B_Gen5_1 \
--version 5.7

# DB Firewall konfigurieren

az mysql server firewall-rule create -g $resourceGroup --server $mysqlServerName --name AllowAppService --start-ip-address c --end-ip-address 0.0.0.0

# Datenbank für Wordpress erstellen

az mysql db create --resource-group $resourceGroup --server-name $mysqlServerName --name $mysqlDBName

# Netzwerk

# Virtueles Netzwerk erstellen

az network vnet create \   
--name $vnetwordpress \   
--resource-group $resourceGroup \   
--address-prefixes 10.0.0.0/16

# Subnetz appService erstellen

```
az network vnet subnet create \   
--name $subnetwp \   
--resource-group $resourceGroup \ 
--vnet-name $vnetwordpress \   
--address-prefixes 10.0.1.0/24 


# Subnetz databse erstellen

az network vnet subnet create \
--name $subnetdb \
--resource-group $resourceGroup \ 
--vnet-name $vnetwordpress \  
--address-prefixes 10.0.2.0/24 

# Subnetze mit Azure Services verbinden

az network vnet subnet update \
--name $subnetwp \
--vnet-name $vnetwordpress \
--resource-group $resourceGroup \
--delegations Microsoft.Web/serverFarms 

az network vnet subnet update \
--name $subnetdb \ 
--vnet-name $vnetwordpress \
--resource-group $resourceGroup \
--delegations Microsoft.DBforMySQL/servers

#Wordpress DB Configuration hinterlegen
$Find_DBHostName = (az mysql server show -g $resourceGroup -n mysqlServerName --query "FullyQualifiedDomainName" -o tsv)

az webapp config appsettings set -n $appName -g resourceGroup --settings \
WORDPRESS_DB_HOST= $Find_DBHostName \
WORDPRESS_DB_USER= $mysqlUsername \
WORDPRESS_DB_PASSWORD= $mysqlPassword