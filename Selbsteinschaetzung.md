# Selbsteinschätzung

## DATENSICHERHEITSKONZEPT

### A1

**Ich kann vorhandene Datensicherungssysteme analysieren und unter Berücksichtigung von Rahmenbedingungen, Vorschriften und erhobene Daten (Einflussfaktoren) ein Datensicherungskonzept entwickeln und fachgerecht darstellen.**

**2.5/4**

- User-Story ist vorhanden, welche konkret einen Service beschreibt (zum Beispiel die Speicherung von Benutzerdaten).

Eine detaillierte [User-Story](https://github.com/Arlind-tbz/modul-143?tab=readme-ov-file#fiktive-user-story) ist vorhanden.

- Elemente aus der GebüV, Datenschutzgesetz und BSI-IT-Grundschutz-Vorgaben sind vorhanden.

Es sind **keine** Datenschutzgesetze vorhanden.

- Konkrete und messbare technische Anforderungen sind konzeptionell definiert - Einflussfaktoren sind auf User-Story abgestützt.

Mit dem [Szenario 7: Kostenoptimierung](https://github.com/Arlind-tbz/modul-143?tab=readme-ov-file#szenario-7-kostenoptimierung) habe ich versucht, viele technische Daten zusammen in Verbindung zu bringen, mithilfe von [Systemleistung](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datenzuwachs) und [Datenzuwachs](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datenzuwachs).

- Im Datensicherungskonzept ist ersichtlich, in welcher Form (Speicherort, Datenmenge) das Backup ausgeführt wird, inklusive den zugehörigen Meta-Informationen (Versionierung, Zeitpunkt).

Im [Datensicherungskonzept](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datensicherungskonzept) sieht man, dass jeden Tag um 20:00 die Backups ausgeführt werden und man sieht die Datenmenge.

### A2

**Ich kann anhand von aktuellen technischen Lösungen ein optimales Datensicherungsverfahren auswählen. Ich berücksichtige bei der Entwicklung des Datensicherungskonzepts anspruchsvolle Einflussfaktoren und weiss, wie diese bei der Realisierung technisch umgesetzt werden.**

**3/4**

- Das Datensicherungsverfahren ist begründet auf einen Use-Case angewendet.

Die Backups werden vom [Szenario 1: Regelmässige Datensicherungen](https://github.com/Arlind-tbz/modul-143?tab=readme-ov-file#szenario-1-regelm%C3%A4ssige-datensicherungen-1) erarbeitet. Wie diese gesichert werden kann man im Abschnitt [Backup-Skript](https://github.com/Arlind-tbz/modul-143?tab=readme-ov-file#backup-skript) nachlesen.

- Der Restore-Prozess ist beschrieben und funktional dokumentiert.

Der Restore-Prozess ist in der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) im Abschnitt [Restore](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#restore) dokumentiert.

- Die gewählte technologische Umsetzung ist auf einen Use-Case angewendet. Wie die Datensicherung erfolgen kann, ist in der Arbeit konkret festgehalten.

Die Technologie wurde vom [Szenario 1: Regelmässige Datensicherungen](https://github.com/Arlind-tbz/modul-143?tab=readme-ov-file#szenario-1-regelm%C3%A4ssige-datensicherungen) abgeleitet.

## MACHBARKEIT

### B1

**Ich kann aufgrund von technischen und betriebswirtschaftlichen Kriterien ein individualisiertes Datensicherungskonzept erstellen und auf Machbarkeit überprüfen.**

**3/4**

- Der gewählte Speicherort wird aus den Anforderungen gemäss dem Use-Case abgeleitet.

In einer Docker-Umgebung ist es immer vorteilhaft für Systemadministratoren, Bind-Volumes zu nutzen, wie es in unserer Umgebung der Fall ist. Im [Use-Case](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story) werden die erforderlichen Daten erläutert. Aus Kosteneffizienzgründen werden jedoch alle Daten im Ordner `./docker` gespeichert, wobei alle Daten verschlüsselt sind.

- Die Verantwortlichkeiten sind entsprechenden Rollen zugewiesen.

Die Verantwortlichkeiten sind in der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) festgelegt. Nur Systemadministratoren haben die Berechtigung, Backups zu starten, Wiederherstellungen durchzuführen und Konfigurationen in OwnCloud und Mailu zu ändern.

- Qualitätssicherungsmerkmale sind thematisiert.

Die Qualitätssicherungsmerkmale werden in den [Testfällen](https://github.com/Arlind-tbz/modul-143#testen) behandelt.

## BERDARFSERMITTLUNG

### C1

**Ich kann den aktuellen und längerfristigen Speicherbedarf ermitteln und individualisierte Lösungen (Geräte, Speichermedien) sowie optimale Datenstandorte (On-Prem, Cloud) ausarbeiten und anbieten.**

**3/4**

- Die zu sichernde Datenmenge wird thematisiert (zum Beispiel Datenzuwachs oder Speicheroptimierung durch Datenarchivieren), sowie der daraus abzuleitende Speicherplatz definiert.

Die Archivierung von Daten und Datenwachstum wird im Abschnitt [Datenwachstum](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datenzuwachs) dokumentiert.

- Die zeitlichen Abhängigkeiten werden anhand der gewählten Backupstrategie definiert.

In meiner Planung wird davon ausgegangen, dass täglich um 20:00 Uhr ein Backup durchgeführt wird, allerdings ist dies irrelevant, da meine Backups inkrementell sind. Weitere Details finden sich im Abschnitt [Datenwachstum](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datenzuwachs).

## SICHERUNGSPROZEDUREN

### D1

**Ich kann selbständig eine funktionsfähige Sicherungs- und Wiederherstellungsprozedur erstellen, automatisieren, testen und individuellen Anforderungen anpassen.**

**4/4**

- Der Vorteil, welcher eine Automatisierung für die Ausführung des Backups bringt, ist konkret ausgearbeitet.

Im Abschnitt [Wie werden wir das umsetzen?](https://github.com/Arlind-tbz/modul-143/tree/main#wie-werden-wir-das-umsetzen) habe ich kurz erläutert, warum wir in unserer Umgebung verstärkt auf Automatisierung setzen.

- Die Automatisierung ist für unterschiedliche Services definiert, oder eine Zusatzfunktion, welche eine Automatisierung ermöglicht, wurde implementiert und dokumentiert.

Die Automatisierung für Updates wurde im Abschnitt [Watchtower (Update-Server)](https://github.com/Arlind-tbz/modul-143/tree/main#watchtower-update-server) dokumentiert.

Die Automatisierung für Backups wurde im Abschnitt [Backup-Skript](https://github.com/Arlind-tbz/modul-143/tree/main#backup-skript) beschrieben.

- Die Anforderungen sind anhand eines Use-Case für unterschiedliche Services begründet.

Alle Automatisierungen wurden gemäss den [Use-Cases](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story) implementiert, beispielsweise die automatischen Updates und Backups.

### D2

**Ich kann eine bestehenden Sicherung- und Wiederherstellungsprozedur erstellen, prüfen, automatisieren und bei Bedarf optimieren oder anpassen.**

**4/4**

- Die Sicherstellung, dass das Backup gemäss dem definierten Zeitplan erfolgreich durchgeführt wurde, ist technisch begründet (Überprüfung via Log-Files).

Sobald der Server nicht abstürzt, werden alle Backups Log-Dateien erstellen - tatsächlich drei Log-Dateien, eine für jede Standortkopie. Dies kann in [meinem Skript](./docker/backup.sh) nachverfolgt werden. Im Abschnitt [Backup-Skript](https://github.com/Arlind-tbz/modul-143/tree/main#backup-skript) habe ich dokumentiert, wie diese Überprüfung automatisiert ist.

- Bei nicht erfolgreichem Backup wird automatisch alarmiert.

Wenn ein Backup fehlschlägt, wird eine entsprechende Log-Datei im Verzeichnis `/var/log/tbz/` erstellt, die anzeigt, dass der Rsync-Befehl nicht ordnungsgemäss ausgeführt wurde.

- Proaktive Massnahmen (zum Beispiel bei voraussichtlichem Speichermangel) sind implementiert.

Benutzer haben immer eine Begrenzung für die Anzahl der Dateien, die sie speichern können. Diese Begrenzung kann jedoch vom Systemadministrator angepasst werden, wie in der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) dokumentiert. Wenn der Server selbst knapp an Speicherplatz ist, sollte dies kein Problem darstellen, da Docker in der Regel keine Probleme hat, wenn sich die Dateisystemgrösse ändert.

### D3

**Ich kann eine vollständige Dokumentation einer Sicherungs- und Wiederherstellungsprozedur erstellen, welche die Konfiguration sowie die Funktionalität dazu nachvollziehbar abbildet. Ich kann eine verständliche Dokumentation einer Sicherungs- und Wiederherstellungsprozedur erstellen.**

**4/4**

- Die Anleitung informiert sowohl den Benutzer als auch den Systemadministrator über alle relevanten Parameter für die Datensicherung.

In meiner [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) und im [Datensicherungskonzept](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datensicherungskonzept) sollten alle [Use-Cases](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story) abgedeckt sein, und alle Schritte sind nachvollziehbar.

- Es werden klare Informationen bereitgestellt, unter welchen Bedingungen die Datensicherung gewährleistet ist.

Benutzer und Systemadministratoren können aufgrund meiner [Dokumentation](https://github.com/Arlind-tbz/modul-143#hauptteil---aufsetzen-der-umgebung) (nicht der Betriebsdokumentation) und [Testfällen](https://github.com/Arlind-tbz/modul-143#testen) sicherstellen, ob die Informationen zuverlässig gesichert werden.

- Der gesamte Prozess ist in einer visuellen Darstellung veranschaulicht.

Der Prozess ist im [Datensicherungskonzept](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datensicherungskonzept) visuell dargestellt.

## SYSTEM- UND BETRIEBSDOKUMENTATION

### E1

**Erstellung einer umfassenden und visuellen System- und Betriebsdokumentation**

**4/4**

- Eine auf die User-Story zugeschnittene Betriebsdokumentation wurde erstellt und korrekt technisch umgesetzt.

In meiner [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) habe ich umfangreiche Informationen basierend auf meiner [User-Story](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story) dokumentiert. Dies umfasst Themen wie Password Recovery, die Erstellung neuer Nutzer und ein umfassendes Konzept zur Funktionsweise unseres Systems.

- Die Betriebsdokumentation enthält Visualisierungen wie ein Blockschaltbild und einen logischen Netzwerkplan, um die wesentlichen Zusammenhänge in der Systemumgebung zu verdeutlichen (Netzgrenzen, Virtualisierung).

In der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) habe ich ein [Datensicherungskonzept](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datensicherungskonzept) erstellt, das als Netzwerkplan und Datensicherungskonzept dient. Es enthält Informationen zu IPs, Konfigurationen und stellt die Backup-Strategie dar.

- Die präsentierten Visualisierungen unterscheiden die beispielhafte Umsetzung auf meinem eigenen Notebook von der Umsetzung in einer produktiven Umgebung.

In meinem Plan ist visualisiert, dass wir einen Proxy verwenden und dass alle Kommunikation über diesen Server über den Proxy geleitet wird.

- Die Freigaben und zugehörigen Berechtigungen, Benutzer und Benutzergruppen sind für die einzelnen Services dokumentiert.

Die Benutzergruppen für OwnCloud und Mailu sind in der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) ausführlich dokumentiert, basierend auf meiner [User-Story](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story).

### E2

**Erstellung eines umfassenden Testszenarios für bestimmte Funktionalitäten und Durchführung sowie Dokumentation der erforderlichen Systemtests.**

**4/4**

- Ein Testszenario wurde anhand des Use-Cases und pro Service erarbeitet.

Alle [Testszenarien](https://github.com/Arlind-tbz/modul-143/tree/main#testen) basieren auf den Use-Cases in der [User-Story](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story).

- Die Testprotokolle wurden pro Service erstellt und sind nachvollziehbar dokumentiert.

Die Testprotokolle sind pro Service strukturiert und in Fällen, in denen ein Test mehrere Services betrifft, wird dies dennoch gut und verständlich dokumentiert.

- Die Tests wurden anhand der Systemrückmeldung überprüft und die Ergebnisse wurden bewertet.

Alle Tests wurden sorgfältig durchgeführt und anhand von Logs und Fakten überprüft.

- Im Falle nicht erfolgreicher Tests wurden proaktive Massnahmen definiert, um Fehler möglichst systemisch und automatisiert für weitere Durchläufe zu vermeiden (Systemoptimierung).

Alle Tests waren erfolgreich und erforderten keine weiteren proaktiven Massnahmen.

## ERWEITERUNGEN

### F1

**Mehrere Zusatzfunktionen und oder Überlegungen sind vorhanden. Die erreichte Funktionalität und Qualität der Arbeit ist insgesamt deutlich über den Erwartungen.**

**3/4**

- Die eigentliche Systemwiederherstellung ist ebenfalls thematisiert oder umgesetzt

Mein [Restore-Skript](./docker/restore.sh) funktioniert einwandfrei, solange ein Backup vorhanden ist. Es bietet die Möglichkeit, die Restore-Location auszuwählen, sei es HDD, Tape oder Remote. Für den Remote Restore musste ich auch den Befehl `scp -r` anpassen, wie im Abschnitt [Restore-Skript](https://github.com/Arlind-tbz/modul-143/tree/main?tab=readme-ov-file#restore-skript) beschrieben.

- Es ist mehr als ein zusätzlicher Service definiert

Ich konnte 3 zusätzliche Services implementieren: einen Update-Server mithilfe von [Watchtower](https://github.com/Arlind-tbz/modul-143/tree/main?tab=readme-ov-file#watchtower-update-server), einen Reverse Proxy mithilfe von [Traefik](https://github.com/Arlind-tbz/modul-143/tree/main?tab=readme-ov-file#traefik-reverse-proxy) und einen [Mailserver](https://github.com/Arlind-tbz/modul-143/tree/main?tab=readme-ov-file#mailu-mail-server) mithilfe von Mailu. Alle Services wurden dokumentiert und getestet.

- Die Dokumentation ist fortschrittlich umgesetzt (Markdown-Format, in einem Repository integriert, für die Benutzeranleitung wird ein Wiki verwendet oder in Form eines Mindmaps abgebildet)

Die gesamte Dokumentation ist im Markdown-Format verfasst und verwendet keine HTML-Add-Ons. Es sind auch Alt-Texte für alle Bilder vorhanden.
