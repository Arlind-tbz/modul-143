# Selbsteinschätzung

## DATENSICHERHEITSKONZEPT

### A1 Ich kann vorhandene Datensicherungssysteme analysieren und unter Berücksichtigung von Rahmenbedingungen, Vorschriften und erhobene Daten (Einflussfaktoren) ein Datensicherungskonzept entwickeln und fachgerecht darstellen.

- User-Story beinhaltet komplexe Anforderungen mit zusätzlichen Services (nicht nur File-Ablage, sondern auch die Datensicherung von einem Web-Server oder Mail-Server)

asdf

- Die Vorgaben gemäss der GebüV, Datenschutzgesetz und BSI-IT-Grundschutz-Vorgaben sind eingehalten.

asdf

- Konkrete und messbare technische Anforderungen sind konzeptionell definiert (Partitionierung / Filesystem)

asdf

- Im Datensicherungskonzept ist für jeden Service definiert, in welcher Form (Speicherort, Datenmenge, Datenformat) das Backup ausgeführt wird, inklusive den zugehörigen Meta-Informationen (Versionierung, Zeitpunkt).

asdf

- Die Speicherkapazität ist für den zukünftigen Speicherzuwachs mit konkreten Werten berechnet (Beispiel für Berechnung mit Tool: Backup Capacity Calculator - WintelGuy.com)

asdf

### A2 Ich kann anhand von aktuellen technischen Lösungen ein optimales Datensicherungsverfahren auswählen. Ich berücksichtige bei der Entwicklung des Datensicherungskonzepts anspruchsvolle Einflussfaktoren und weiss, wie diese bei der Realisierung technisch umgesetzt werden.

- Das Datensicherungsverfahren ist begründet auf einen Use-Case evaluiert und angewendet. Verschiedene Verfahren werden miteinander verglichen und anhand von konkreten und messbaren Vergleichskriterien das geeignetste bestimmt.

asdf

- Der Restore-Prozess ist beschrieben und funktional dokumentiert und getestet worden.

asdf

- Es wird konzeptionell klar unterschieden zwischen der Sicherung von Benutzerdaten (originäre Daten) und den Systemdaten (Systemkonfigurationsdaten oder Systemimages).

asdf

- Die gewählte technologische Umsetzung ist auf einen Use-Case angewendet. Wie die Datensicherung erfolgen kann, ist für unterschiedliche Services konkret festgehalten.

asdf

## MACHBARKEIT

### B1 Ich kann aufgrund von technischen und betriebswirtschaftlichen Kriterien ein individualisiertes Datensicherungskonzept erstellen und auf Machbarkeit überprüfen.

- Die zu sichernden Daten werden konkret anhand eines Use-Cases und mit Bezug auf unterschiedliche Services definiert und das Datensicherungskonzept auf allgemeinen Vorgaben und Empfehlungen (BSI-Handbuch) abgestützt.

asdf

- Besonders schützenswerte Daten werden gesondert behandelt und verschlüsselt gesichert.

asdf

- Der optimale Speicherort wird anhand des Use-Cases und pro Service definiert.

asdf

- Die Verantwortlichkeiten sind entsprechenden Rollen zugewiesen.

asdf

- Qualitätssicherungsmerkmale sind ausgearbeitet.

## BERDARFSERMITTLUNG

### C1 Ich kann den aktuellen und längerfristigen Speicherbedarf ermitteln und individualisierte Lösungen (Geräte, Speichermedien) sowie optimale Datenstandorte (On-Prem, Cloud) ausarbeiten und anbieten.

- Die zu sichernde Datenmenge wird konkret anhand eines Use-Cases und mit Bezug auf unterschiedliche Services visualisiert festgehalten (zum Beispiel Datenzuwachs oder Speicheroptimierung durch Datenarchivieren).

asdf

- Der daraus abzuleitende Speicherplatz wird konkret definiert. Die unterschiedlichen Ablageorte und deren Nutzen sind definiert.

asdf

- Die zeitlichen Abhängigkeiten werden anhand der gewählten Backupstrategie und dem Use-Case definiert.

asdf

- Die Unterschiede einer lokalen Datenspeicherung und einer Cloud-Basierten Datenspeicherung sind ersichtlich.

asdf

- Die Kostenfolgen sowie rechtliche Aspekte sind bei der Wahl einer Cloud-Lösung thematisiert. Die Leistung von unterschiedlichen Providern wird verglichen.

asdf

## SICHERUNGSPROZEDUREN

### D1 Ich kann selbständig eine funktionsfähige Sicherungs- und Wiederherstellungsprozedur erstellen, automatisieren, testen und individuellen Anforderungen anpassen.

- Der Vorteil, welcher eine Automatisierung für die Ausführung des Backups bringt, ist konkret ausgearbeitet.

asdf

- Die Automatisierung ist für unterschiedliche Services definiert, oder eine Zusatzfunktion, welche eine Automatisierung ermöglicht, wurde implementiert und dokumentiert.

asdf

- Die Anforderungen sind anhand eines Use-Case für unterschiedliche Services begründet.

asdf

### D2 Ich kann eine bestehenden Sicherung- und Wiederherstellungsprozedur erstellen, prüfen, automatisieren und bei Bedarf optimieren oder anpassen.

- Die Sicherstellung, dass das Backup gemäss dem definierten Zeitplan erfolgreich durchgeführt wurde, ist technisch begründet (Überprüfung via Log-Files).

Sobald der Server nicht abstürzt, werden alle Backups Log-Dateien erstellen - tatsächlich drei Log-Dateien, eine für jede Standortkopie. Dies kann in [meinem Skript](./docker/backup.sh) nachverfolgt werden. Im Abschnitt [Backup-Skript](https://github.com/Arlind-tbz/modul-143/tree/main#backup-skript) habe ich dokumentiert, wie diese Überprüfung automatisiert ist.

- Bei nicht erfolgreichem Backup wird automatisch alarmiert.

Wenn ein Backup fehlschlägt, wird eine entsprechende Log-Datei im Verzeichnis `/var/log/tbz/` erstellt, die anzeigt, dass der Rsync-Befehl nicht ordnungsgemäss ausgeführt wurde.

- Proaktive Massnahmen (zum Beispiel bei voraussichtlichem Speichermangel) sind implementiert.

Benutzer haben immer eine Begrenzung für die Anzahl der Dateien, die sie speichern können. Diese Begrenzung kann jedoch vom Systemadministrator angepasst werden, wie in der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) dokumentiert. Wenn der Server selbst knapp an Speicherplatz ist, sollte dies kein Problem darstellen, da Docker in der Regel keine Probleme hat, wenn sich die Dateisystemgrösse ändert.

### D3 Ich kann eine vollständige Dokumentation einer Sicherungs- und Wiederherstellungsprozedur erstellen, welche die Konfiguration sowie die Funktionalität dazu nachvollziehbar abbildet. Ich kann eine verständliche Dokumentation einer Sicherungs- und Wiederherstellungsprozedur erstellen.

- Die Anleitung informiert sowohl den Benutzer als auch den Systemadministrator über alle relevanten Parameter für die Datensicherung.

In meiner [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) und im [Datensicherungskonzept](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datensicherungskonzept) sollten alle [Use-Cases](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story)) abgedeckt sein, und alle Schritte sind nachvollziehbar.

- Es werden klare Informationen bereitgestellt, unter welchen Bedingungen die Datensicherung gewährleistet ist.

Benutzer und Systemadministratoren können aufgrund meiner [Dokumentation](https://github.com/Arlind-tbz/modul-143#hauptteil---aufsetzen-der-umgebung) (nicht der Betriebsdokumentation) und [Testfällen](https://github.com/Arlind-tbz/modul-143#testen) sicherstellen, ob die Informationen zuverlässig gesichert werden.

- Der gesamte Prozess ist in einer visuellen Darstellung veranschaulicht.

Der Prozess ist im [Datensicherungskonzept](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datensicherungskonzept) visuell dargestellt.

## SYSTEM- UND BETRIEBSDOKUMENTATION

### E1 Erstellung einer umfassenden und visuellen System- und Betriebsdokumentation

- Eine auf die User-Story zugeschnittene Betriebsdokumentation wurde erstellt und korrekt technisch umgesetzt.

In meiner [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) habe ich umfangreiche Informationen basierend auf meiner [User-Story](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story) dokumentiert. Dies umfasst Themen wie Password Recovery, die Erstellung neuer Nutzer und ein umfassendes Konzept zur Funktionsweise unseres Systems.

- Die Betriebsdokumentation enthält Visualisierungen wie ein Blockschaltbild und einen logischen Netzwerkplan, um die wesentlichen Zusammenhänge in der Systemumgebung zu verdeutlichen (Netzgrenzen, Virtualisierung).

In der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) habe ich ein [Datensicherungskonzept](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md#datensicherungskonzept) erstellt, das als Netzwerkplan und Datensicherungskonzept dient. Es enthält Informationen zu IPs, Konfigurationen und stellt die Backup-Strategie dar.

- Die präsentierten Visualisierungen unterscheiden die beispielhafte Umsetzung auf meinem eigenen Notebook von der Umsetzung in einer produktiven Umgebung.

In meinem Plan ist visualisiert, dass wir einen Proxy verwenden und dass alle Kommunikation über diesen Server über den Proxy geleitet wird.

- Die Freigaben und zugehörigen Berechtigungen, Benutzer und Benutzergruppen sind für die einzelnen Services dokumentiert.

Die Benutzergruppen für OwnCloud und Mailu sind in der [Betriebsdokumentation](https://github.com/Arlind-tbz/modul-143/blob/main/Betriebsdokumentation.md) ausführlich dokumentiert, basierend auf meiner [User-Story](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story).

### E2 Erstellung eines umfassenden Testszenarios für bestimmte Funktionalitäten und Durchführung sowie Dokumentation der erforderlichen Systemtests.

- Ein Testszenario wurde anhand des Use-Cases und pro Service erarbeitet.

Alle [Testszenarien](https://github.com/Arlind-tbz/modul-143/tree/main#testen) basieren auf den Use-Cases in der [User-Story](https://github.com/Arlind-tbz/modul-143/tree/main#fiktive-user-story).

- Die Testprotokolle wurden pro Service erstellt und sind nachvollziehbar dokumentiert.

Die Testprotokolle sind pro Service strukturiert und in Fällen, in denen ein Test mehrere Services betrifft, wird dies dennoch gut und verständlich dokumentiert.

- Die Tests wurden anhand der Systemrückmeldung überprüft und die Ergebnisse wurden bewertet.

Alle Tests wurden sorgfältig durchgeführt und anhand von Logs und Fakten überprüft.

- Im Falle nicht erfolgreicher Tests wurden proaktive Massnahmen definiert, um Fehler möglichst systemisch und automatisiert für weitere Durchläufe zu vermeiden (Systemoptimierung).

Alle Tests waren erfolgreich und erforderten keine weiteren proaktiven Massnahmen.

## ERWEITERUNGEN

### F1 Mehrere Zusatzfunktionen und oder Überlegungen sind vorhanden. Die erreichte Funktionalität und Qualität der Arbeit ist insgesamt deutlich über den Erwartungen.

- Die Qualität der Arbeit übersteigt die normalen Anforderungen

asdf

- Die erstellte Umgebung hat eine gewisse Komplexität.

asdf

- Lösungsvarianten vergleichen mit konkreten Kriterien, zum Beispiel Energieverbrauch, Kosten, Sicherheit, Auswirkung auf Anwendungsfall, Skalierung und der daraus resultierenden Empfehlung.

asdf

- Risiko-Analyse der ausgearbeiteten Backup- und Restore-Lösung

asdf
