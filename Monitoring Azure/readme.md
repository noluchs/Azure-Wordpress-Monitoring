# Azure Monitoring

## Was ist Azure Monitoring

Azure Monitoring wird verwendet, um die Leistung und Verfügbarkeit von Anwendungen und Ressourcen in der Azure-Cloud zu überwachen. Dabei werden Daten aus verschiedenen Quellen wie Metriken, Protokollen, Ereignissen und Benachrichtigungen gesammelt und in einer einheitlichen Ansicht dargestellt. Durch die Nutzung von Azure Monitoring können Anwender Einblicke in das Verhalten und die Aktivität ihrer Anwendungen und Ressourcen erhalten, Probleme schnell identifizieren und beheben, Trends analysieren und optimieren sowie Alarme und Aktionen definieren, um auf spezifische Bedingungen zu reagieren. Azure Monitoring unterstützt sowohl native Azure-Dienste als auch andere Cloud- oder On-Premise-Lösungen, die mit Azure integriert sind.

## Wie wird es eingesetzt

Im Rahmen dieses Projekts setzen wir Azure Monitoring ein, um unsere Umgebung zu überwachen. Wir nutzen verschiedene Metriken, um die CPU-Auslastung, den Arbeitsspeicher und den Speicherplatz kontinuierlich zu überprüfen. Zusätzlich wird alle fünf Minuten überprüft, ob die Website über das DNS erreichbar ist. Sollte der AppService oder MySQL nicht ordnungsgemäß funktionieren, werden entsprechende Maßnahmen ergriffen.

![](attachments/Pasted%20image%2020230709220815.png)

## Umsetzung
[App Service Wordpress](App%20Service%20Wordpress.md)
[Azure MySQL](Azure%20MySQL.md)

## Testen
[Load Testing Website](Load%20Testing%20Website.md)




