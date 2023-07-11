# Load Testing Website


Um die Performance der Website zu testen, bietet Azure den Dienst Azure Load Testing an, mit dem die Performance und Skalierbarkeit von Webanwendungen getestet werden kann. Mit Azure Load Testing können verschiedene Szenarien simuliert werden, wie zum Beispiel hohe Nutzerzahlen, geografische Verteilung oder Netzwerklatenz. Azure Load Testing generiert Metriken und Berichte, die zeigen, wie die Webanwendung unter Last reagiert. Diese Informationen können genutzt werden, um Alarme zu überprüfen, die bei bestimmten Schwellenwerten ausgelöst werden sollen. Was in unserem Fall im Fokus stand


## Einrichten

Als erstes konfiguriert man eine load testing resource von dem man dan die Test starten kann.
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