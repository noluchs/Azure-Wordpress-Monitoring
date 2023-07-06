# Azure-Wordpress-Monitoring

## Projektbeschreib

### Problematik

Die Webseite läuft momentan noch bei einem Web Hoster und sollte auf die Azure migriert werden. Die Hauptanforderung dieser Semesterarbeit ist eine Überwachung der Azure Services zu implementieren, um somit einen störungsfreien Betrieb der Webseite zu gewährleisten. Die laufenden Betriebskosten sollen ebenfalls überwacht werden.

### Ziel
Auf Azure einen App Services (Wordpress) und den Dienst Azure Database for MySQL (DB Wordpress) mit AZ CLI erstellen. Diese Umgebung wird dann mit Azure Monitoring laufend geprüft und falls gewisse Grenzwerte erreicht oder Dienste nicht mehr aktiv sind, werden Notifikationen (Alerts) versendet.

Monitoring beinhaltet folgende Punkte:

* Uptime Dienste
* Erreichbarkeit Website über externe IP und DNS
* Speicherplatz
* Ressourcennutzung
* Kosten


## Inhaltsverzeichnis
#### Aufbau Instanz
[Aufbau Wordpress MySQL Cli](Aufbau%20Azure%20Wordpress/Aufbau%20Wordpress%20MySQL%20Cli.md)
#### Aufbau Monitoring
[App Service Wordpress](Monitoring%20Azure/App%20Service%20Wordpress.md)
[Azure MySQL](Monitoring%20Azure/Azure%20MySQL.md)

#### Projektplanung
##### Sprint
[Erster Sprint](Sprint/Erster%20Sprint.md)
[Zweiter Sprint](Sprint/Zweiter%20Sprint.md)

##### Kanban
[Kanban](Kanban.md)



## Projektphasen

### Phase 1: Vorbereitung

In dieser Phase wird das Einreichungsformular ausgefüllt und eine Recherche zum Azure Monitoring durchgeführt. Die Dokumentation wird ebenfalls in dieser Phase begonnen.

#### Aufgaben

- Einreichungsformular ausfüllen (14.04.2023 - 19.04.2023)
- Recherche zum Azure Monitoring durchführen (19.04.2023 - 24.06.2023)
- Dokumentation beginnen (20.04.2023 - 30.06.2023)

### Phase 2: Umsetzung von Wordpress mit DB

In dieser Phase wird ein App Service (Wordpress) und der Dienst Azure Database for MySQL (DB Wordpress) mit AZ CLI auf Azure erstellt. Dies bildet die Grundlage für die weitere Überwachung.

#### Aufgaben

- Erstellung eines App Service (Wordpress) auf Azure (20.04.2023 - 15.05.2023)
- Erstellung des Dienstes Azure Database for MySQL (DB Wordpress) auf Azure (20.04.2023 - 15.05.2023)
- Automatiseren per CLI (Script) des Aufsetzen von App Serivce & der Azure MySQL DB

### Phase 3: Umsetzung von Azure Monitoring

In dieser Phase wird das Azure Monitoring implementiert, um die Uptime der Dienste, die Erreichbarkeit der Website über externe IP und DNS, den Speicherplatz, die Ressourcennutzung und die Kosten zu überwachen. Wenn bestimmte Grenzwerte erreicht werden oder Dienste nicht mehr aktiv sind, werden Notifikationen (Alerts) versendet.

#### Aufgaben

- Implementierung des Azure Monitorings zur Überwachung der Ressourcen der Dienste (15.05.2023 - 14.06.2023)
- Implementierung des Azure Monitorings zur Überwachung der Erreichbarkeit der Website über externe IP und DNS (15.05.2023 - 14.06.2023)
- Implementierung des Azure Monitorings zur Überwachung des Speicherplatzes (15.05.2023 - 14.06.2023)
- Implementierung des Azure Monitorings zur Überwachung der Ressourcennutzung (15.05.2023 - 14.06.2023)
- Implementierung des Azure Monitorings zur Überwachung der Kosten (15.05.2023 - 14.06.2023)
- Einrichtung von Notifikationen (Alerts) bei Erreichen bestimmter Grenzwerte oder bei Inaktivität von Diensten (15.05.2023 - 14.06.2023)

### Phase 4: Abschluss

In dieser Phase werden offene Aufgaben erledigt und die Dokumentation fertiggestellt. Die Arbeit wird schließlich abgegeben.

#### Aufgaben

- Erledigung offener Aufgaben 15.06.2023-08.07.2023
- Vorbereitung der Präsentation 15.06.2023-08.07.2023
- Abschliessen der DOkumentation 15.06.2023-10.07.2023
- Abgabe der Arbeit (12.07.2023)

## Zeitplan

|   |   |   |
|---|---|---|
|**Task**|**Von**|**Bis**|
|Einreichungsformular|14.04.2023|19.04.2023|
|Recherche Azure Monitoring|19.04.2023|24.06.2023|
|Dokumentation|20.04.2023|30.06.2023|
|Umsetzung  **Wordpress mit DB**|20.04.2023|15.05.2023|
|1. Sprint||15.05.2023|
|Umsetzung **Azure Monitoring**|15.05.2023|14.06.2023|
|2. Sprint||14.06.2023|
|Offene Task|15.06.2023|11.07.2023|
|Präsentation vorbereiten|30.06.2023|11.07.2023|
|3. Sprint||12.07.2023|
|Abgabe Arbeit||12.07.2023|

