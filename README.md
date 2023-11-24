# Modul 143 - Backup- und Restore-Systeme implementieren

Willkommen zu meinem Repostiory zum "Modul 143 - Backup- und Restore-Systeme implementieren"

- [Kompetenzmatrix](./Kompetenzmatrix.MD)
- [Punktebewertung Praxisarbeit mit Erklärungen](./src/M143-Punktebewertung-Praxisarbeit-mit-Erklärungen.pdf)
- [Selbsteinschätzung](./Selbsteinschaetzung.md)
- [Dockerfiles](./docker/)

## Einleitung - Datensicherheitskonzept

### Fiktive User-Story

**Sichere Datenbackups für die Firma Sota GmbH**

> IT-Manager bei der Firma Sota GmbH

Wir möchten eine robuste Lösung zur Datensicherung implementieren, um die Sicherheit und Verfügbarkeit unserer wichtigen Geschäftsdaten im Falle von unvorhergesehenen Ereignissen wie Hardwareausfällen, Datenkorruption oder Katastrophen zu gewährleisten.

**Dies sind unsere Akzeptanzkriterien:**

#### Szenario 1: Regelmässige Datensicherungen

- Unser Ziel ist es, täglich mindestens eine Datensicherung durchzuführen und sicherzustellen, dass diese ordnungsgemäß gespeichert wird.

#### Szenario 2: Mehrere Backup-Standorte

- Wir streben an, unsere Backups sicher gemäß den Prinzipien des 3-2-1-Backups zu speichern:
  - 3 Kopien lokal
  - 2 auf verschiedenen Medien
  - 1 in der Cloud

#### Szenario 3: Verschlüsselung

- Wir legen Wert darauf, dass unsere Backups, E-Mails und Daten sicher verschlüsselt werden. Zudem sollte unsere gesamte Umgebung vollständig über HTTPS gesichert sein.

#### Szenario 4: Regelmässige Updates

- Wir planen, unsere Systeme immer auf dem neuesten Stand zu halten, indem wir jeden Freitagabend um 20:00 Uhr System-Upgrades durchführen.

#### Szenario 5: Mail-Server

- Ein funktionsfähiger Mail-Server ist für uns von Bedeutung, jedoch ausschließlich für die interne Kommunikation. Darüber hinaus möchten wir einen zentralen Account einrichten, über den wir Updates und Backup-Benachrichtigungen erhalten oder auf andere Weise informiert werden.

#### Szenario 6: Dokumentation

- Wir benötigen eine umfassende Dokumentation, die erläutert, wie Sie alle Aufgaben ausgeführt haben, und wie wir alles nutzen können, einschließlich der Synchronisierung und gemeinsamen Nutzung von Dateien sowie des E-Mail-Programms.

#### Szenario 7: Kostenoptimierung

- Unsere Präferenz liegt auf kosteneffizienten Lösungen. Das schließt die Verwendung von Zertifikaten von Let's Encrypt, zertifikatslosen Programmen und stromsparenden Anwendungen mit ein.

### Datenschutzgesetz

asdf

### Datensicherungskonzept

asdf

### Speicherkapazität

asdf

## Hauptteil - Aufsetzen der Umgebung

### Welche Services werden wir benötigen?

Ich habe von meinem Kunden viele Akzeptanzkriterien erhalten, diese wären hauptsächlich:
- Share und Sync Server
- Mail Server
- Domain mit TLS

Da wir eine Domain haben brauchen wir also auch einen Reverse Proxy.
