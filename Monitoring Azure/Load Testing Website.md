# Load Testing Website


Azure bietet den Dienst Azure Load Testing an, um die Leistungsfähigkeit von Websites zu testen. Dieser Dienst ermöglicht es, die Performance und Skalierbarkeit von Webanwendungen zu überprüfen. Dabei können verschiedene Szenarien simuliert werden, wie zum Beispiel hohe Nutzerzahlen, geografische Verteilung oder Netzwerklatenz. Azure Load Testing erzeugt Metriken und Berichte, die Auskunft darüber geben, wie die Webanwendung unter Last reagiert. Diese Informationen können genutzt werden, um die Alarme zu überprüfen, die bei bestimmten Schwellenwerten ausgelöst werden sollen. In unserem Fall lag der Fokus genau darauf.


## Einrichten

Als erstes konfiguriert man eine load Testing Ressource von dem man dann die Tests starten kann.
![](attachments/Pasted%20image%2020230708171636.png)


## Erster load Test

Den ersten Test war eine Probe da dann die ganze WordPress Umgebung noch nicht ganz sauber läuft. Man bemerkte das bei diesem Test keine Allerts ausgelöst wurden.
![](attachments/Pasted%20image%2020230709142311.png)

#### Resultat
![](attachments/Pasted%20image%2020230709221441.png)


## Zweiter Test

Dieser haben wir dann noch gemacht als die Website nun final bei Azure lief. Mann sieht dementsprechend das bei den 100 gleichzeitigen User bei dem App-Service die Ressourcen bei CPU 80 Prozent und Memory über 180 MB Arbeitsspeicher ging, um den andrang zu bewerkstelligen. Daraus kann man auch das Fazit ziehen, falls ein mehr andrang erwartet wird mehr Ressourcen benötigten werden.
![](attachments/Pasted%20image%2020230711231021.png)


### Ergebnis

#### Alerts Mail

![](attachments/Pasted%20image%2020230711233039.png)
![](attachments/Pasted%20image%2020230711233113.png)