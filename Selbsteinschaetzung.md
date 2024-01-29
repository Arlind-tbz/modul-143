# Selbsteinschätzung

## DATENSICHERHEITSKONZEPT

### A1 Ich kann vorhandene Datensicherungssysteme analysieren und unter Berücksichtigung von Rahmenbedingungen, Vorschriften und erhobene Daten (Einflussfaktoren) ein Datensicherungskonzept entwickeln und fachgerecht darstellen.

- User-Story beinhaltet komplexe Anforderungen mit zusätzlichen Services (nicht nur File-Ablage, sondern auch die Datensicherung von einem Web-Server oder Mail-Server)
- Die Vorgaben gemäss der GebüV, Datenschutzgesetz und BSI-IT-Grundschutz-Vorgaben sind eingehalten.
- Konkrete und messbare technische Anforderungen sind konzeptionell definiert (Partitionierung / Filesystem)
- Im Datensicherungskonzept ist für jeden Service definiert, in welcher Form (Speicherort, Datenmenge, Datenformat) das Backup ausgeführt wird, inklusive den zugehörigen Meta-Informationen (Versionierung, Zeitpunkt).
- Die Speicherkapazität ist für den zukünftigen Speicherzuwachs mit konkreten Werten berechnet (Beispiel für Berechnung mit Tool: Backup Capacity Calculator - WintelGuy.com)

### A2 Ich kann anhand von aktuellen technischen Lösungen ein optimales Datensicherungsverfahren auswählen. Ich berücksichtige bei der Entwicklung des Datensicherungskonzepts anspruchsvolle Einflussfaktoren und weiss, wie diese bei der Realisierung technisch umgesetzt werden.

- Das Datensicherungsverfahren ist begründet auf einen Use-Case evaluiert und angewendet. Verschiedene Verfahren werden miteinander verglichen und anhand von konkreten und messbaren Vergleichskriterien das geeignetste bestimmt.
- Der Restore-Prozess ist beschrieben und funktional dokumentiert und getestet worden.
- Es wird konzeptionell klar unterschieden zwischen der Sicherung von Benutzerdaten (originäre Daten) und den Systemdaten (Systemkonfigurationsdaten oder Systemimages).
- Die gewählte technologische Umsetzung ist auf einen Use-Case angewendet. Wie die Datensicherung erfolgen kann, ist für unterschiedliche Services konkret festgehalten.

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

asdf

- Bei nicht erfolgreichem Backup wird automatisch alarmiert.

asdf

- Proaktive Massnahmen (zum Beispiel bei voraussichtlichem Speichermangel) sind implementiert.

asdf

### D3 Ich kann eine vollständige Dokumentation einer Sicherungs- und Wiederherstellungsprozedur erstellen, welche die Konfiguration sowie die Funktionalität dazu nachvollziehbar abbildet. Ich kann eine verständliche Dokumentation einer Sicherungs- und Wiederherstellungsprozedur erstellen.

- Der Benutzer sowie der Systemadministrator werden durch die Anleitung über alle Parameter, welche für die Datensicherung relevant sind, informiert.

asdf

- Der Benutzer erhält konkrete Informationen, unter welchen Voraussetzungen die Datensicherung gewährleistet werden kann.

asdf

- Der Prozess ist visualisiert.

asdf

## SYSTEM- UND BETRIEBSDOKUMENTATION

### E1 Ich kann eine umfangreiche und visualisierte System- und Betriebsdokumentation erstellen.

- Eine zur User-Story passende Betriebsdokumentation ist vorhanden, technisch korrekt abgebildet.

asdf

- Die Betriebsdokumentation enthält Visualisierungen, wie Blockschaltbild und logischer Netzwerkplan, aus denen die wesentlichen Zusammenhänge der Systemumgebung erkennbar sind (Netzgrenzen, Virtualisierung)

asdf

- Die dargestellten Visualisierungen unterscheiden die Beispielhafte Umsetzung auf dem eigenen Notebook und der Umsetzung in einer produktiven Umgebung.

asdf

- Die Freigaben und die zugehörenden Berechtigungen, Benutzer und Benutzergruppen sind für die einzelnen Services dokumentiert.

asdf

### E2 Ich kann ein umfangreiches Testszenario für bestimmte Funktionalitäten erarbeiten und die erforderlichen Systemtests ausführen und dokumentieren.

- Ein Testszenario ist anhand des Use-Cases und pro Service erarbeitet.

asdf

- Die Testprotokolle sind pro Service erstellt und nachvollziehbar.

asdf

- Die Tests werden anhand der Systemrückmeldung untersucht und deren Resultat bewertet.

asdf

- Bei nichterfolgreichen Tests werden proaktive Massnahmen definiert, wie der Fehler möglichst systemisch und automatisiert für weitere Durchläufe vermieden werden kann (Systemoptimierung).

asdf

## ERWEITERUNGEN

### F1 Mehrere Zusatzfunktionen und oder Überlegungen sind vorhanden. Die erreichte Funktionalität und Qualität der Arbeit ist insgesamt deutlich über den Erwartungen.

- Die Qualität der Arbeit übersteigt die normalen Anforderungen

asdf

- Die erstellte Umgebung hat eine gewisse Komplexität.

asdf

- Lösungsvarianten vergleichen mit konkreten Kriterien, zum Beispiel Energieverbrauch, Kosten, Sicherheit, Auswirkung auf Anwendungsfall, Skalierung und der daraus resultierenden Empfehlung.

asdf

- Risiko-Analyse der ausgearbeiteten Backup- und Restore-Lösung
