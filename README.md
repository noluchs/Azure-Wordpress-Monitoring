# Azure-Wordpress-Monitoring

## Problematik

Die Webseite läuft momentan noch bei einem Web Hoster und sollte auf die Azure migriert werden. Die Hauptanforderung dieser Semesterarbeit ist eine Überwachung der Azure Services zu implementieren, um somit einen störungsfreien Betrieb der Webseite zu gewährleisten. Die laufenden Betriebskosten sollen ebenfalls überwacht werden.

## Ziel
Auf Azure einen App Services (Wordpress) und den Dienst Azure Database for MySQL (DB Wordpress) mit AZ CLI erstellen. Diese Umgebung wird dann mit Azure Monitoring laufend geprüft und falls gewisse Grenzwerte erreicht oder Dienste nicht mehr aktiv sind, werden Notifikationen (Alerts) versendet.

Monitoring beinhaltet folgende Punkte:

·       Uptime Dienste
·       Erreichbarkeit Website über externe IP und DNS
·       Speicherplatz
·       Ressourcennutzung
·       Kosten



