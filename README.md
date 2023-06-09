# Azure-WordPress-Monitoring

## Projektbeschreib

### Problematik

Die Webseite läuft momentan noch bei einem Web Hoster und sollte auf die Azure migriert werden. Die Hauptanforderung dieser Semesterarbeit ist eine Überwachung der Azure Services zu implementieren, um somit einen störungsfreien Betrieb der Webseite zu gewährleisten. Die laufenden Betriebskosten sollen ebenfalls überwacht werden.

### Ziel
Auf Azure einen App Services (Wordpress) und den Dienst Azure Database for MySQL (DB Wordpress) mit AZ CLI erstellen. Diese Umgebung wird dann mit Azure Monitoring laufend geprüft und falls gewisse Grenzwerte erreicht oder Dienste nicht mehr aktiv sind, werden Notifikationen (Alerts) versendet.

Monitoring beinhaltet folgende Punkte:

* Uptime Dienste
* Erreichbarkeit, Website über externe IP und DNS
* Speicherplatz,
* Ressourcennutzung,
* Kosten


## Inhaltsverzeichnis

* [Aufbau App Service & DB](Aufbau%20Azure%20Wordpress/readme.md)
	* [Script Azure CLI Wordpress](Aufbau%20Azure%20Wordpress/Script/Azure-CLI-WordPress.sh)
* [Monitoring Einrichten](Monitoring%20Azure/readme.md)
	* [App Service Wordpress](Monitoring%20Azure/App%20Service%20Wordpress.md)
	* [Azure MySQL](Monitoring%20Azure/Azure%20MySQL.md)
	* [Load Testing Website](Monitoring%20Azure/Load%20Testing%20Website.md)
* Sprint
	* [Erster Sprint](Sprint/Erster%20Sprint.md)
	* [Zweiter Sprint](Sprint/Zweiter%20Sprint.md)
	* [Dritter Sprint](Sprint/Dritter%20Sprint.md)
* [Kanban](Planung/Kanban.md)
* [Probleme](Probleme.md)
* [Ressourcen](Ressourcen.md)




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

## Projektphasen

### Phase 1: Vorbereitung

In dieser Phase wird das Einreichungsformular ausgefüllt und eine Recherche zum Azure Monitoring durchgeführt. Die Dokumentation wird ebenfalls in dieser Phase begonnen.

#### Aufgaben

- Einreichungsformular ausfüllen (14.04.2023 - 19.04.2023)
- Recherche zum Azure Monitoring durchführen (19.04.2023 - 24.06.2023)
- Dokumentation beginnen (20.04.2023 - 30.06.2023)

### Phase 2: Umsetzung von Wordpress mit DB

In dieser Phase wird ein App-Service (Wordpress) und der Dienst Azure Database for MySQL (DB Wordpress) mit AZ CLI auf Azure erstellt. Dies bildet die Grundlage für die weitere Überwachung.

#### Aufgaben

- Erstellung eines App-Service (Wordpress) auf Azure (20.04.2023 - 15.05.2023)
- Erstellung des Dienstes Azure Database for MySQL (DB Wordpress) auf Azure (20.04.2023 - 15.05.2023)
- Automatisieren per CLI (Script) das Aufsetzen von App Serivce & der Azure MySQL DB

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
- Abschliessen der Dokumentation 15.06.2023-10.07.2023
- Abgabe der Arbeit (12.07.2023)





Diese Dokumentation ist in Obsidian geschrieben für die beste Qualität, die Arbeit mit Obsidian öffnen [Obsidian Herunterladen](https://obsidian.md/)