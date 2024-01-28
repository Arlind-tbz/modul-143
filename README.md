# Modul 143 - Backup- und Restore-Systeme implementieren

Willkommen zu meinem Repostiory zum "Modul 143 - Backup- und Restore-Systeme implementieren"

- [Kompetenzmatrix](./Kompetenzmatrix.MD)
- [Punktebewertung Praxisarbeit mit Erklärungen](./src/M143-Punktebewertung-Praxisarbeit-mit-Erklärungen.pdf)
- [Selbsteinschätzung](./Selbsteinschaetzung.md)
- [Dockerfiles](./docker/)

# Inhaltsverzeichnis

- [Modul 143 - Backup- und Restore-Systeme implementieren](#modul-143---backup--und-restore-systeme-implementieren)
- [Inhaltsverzeichnis](#inhaltsverzeichnis)
- [Einleitung - Datensicherheitskonzept](#einleitung---datensicherheitskonzept)
  - [Fiktive User-Story](#fiktive-user-story)
    - [Szenario 1: Regelmässige Datensicherungen](#szenario-1-regelmässige-datensicherungen)
    - [Szenario 2: Mehrere Backup-Standorte](#szenario-2-mehrere-backup-standorte)
    - [Szenario 3: Verschlüsselung](#szenario-3-verschlüsselung)
    - [Szenario 4: Regelmässige Updates](#szenario-4-regelmässige-updates)
    - [Szenario 5: Mail-Server](#szenario-5-mail-server)
    - [Szenario 6: Dokumentation](#szenario-6-dokumentation)
    - [Szenario 7: Kostenoptimierung](#szenario-7-kostenoptimierung)
- [Hauptteil - Aufsetzen der Umgebung](#hauptteil---aufsetzen-der-umgebung)
  - [Vorbereitung](#vorbereitung)
    - [Welche Services werden wir benötigen?](#welche-services-werden-wir-benötigen)
    - [Für welche Services werden wir uns entscheiden](#für-welche-services-werden-wir-uns-entscheiden)
      - [Reverse Proxy](#reverse-proxy)
      - [Share und Sync Server](#share-und-sync-server)
      - [Mail Server](#mail-server)
      - [Update Server](#update-server)
      - [Domain](#domain)
  - [Umsetzen](#umsetzen)
  - [Testen](#testen)
- [Reflektion](#reflektion)


# Einleitung

## Fiktive User-Story

**Sichere Datenbackups für die Firma Sota GmbH**

> IT-Manager bei der Firma Sota GmbH

Wir möchten eine robuste Lösung zur Datensicherung implementieren, um die Sicherheit und Verfügbarkeit unserer wichtigen Geschäftsdaten im Falle von unvorhergesehenen Ereignissen wie Hardwareausfällen, Datenkorruption oder Katastrophen zu gewährleisten.

**Dies sind unsere Akzeptanzkriterien:**

### Szenario 1: Regelmässige Datensicherungen

- Unser Ziel ist es, täglich mindestens eine Datensicherung durchzuführen und sicherzustellen, dass diese ordnungsgemäss gespeichert wird.

### Szenario 2: Mehrere Backup-Standorte

- Wir streben an, unsere Backups sicher gemäss den Prinzipien des 3-2-1-Backups zu speichern:
  - 3 Kopien
  - 2 auf verschiedenen Medien
  - 1 in der Cloud

### Szenario 3: Verschlüsselung

- Wir legen Wert darauf, E-Mails und Daten sicher verschlüsselt werden. Zudem sollte unsere gesamte Umgebung vollständig über HTTPS gesichert sein.

### Szenario 4: Regelmässige Updates

- Wir planen, unsere Systeme immer auf dem neuesten Stand zu halten, indem wir jeden Freitagabend um 20:00 Uhr System-Upgrades durchführen.

### Szenario 5: Mail-Server

- Ein funktionsfähiger Mail-Server ist für uns von Bedeutung, jedoch ausschliesslich für die interne Kommunikation.

### Szenario 6: Dokumentation

- Wir benötigen eine umfassende Dokumentation, die erläutert, wie Sie alle Aufgaben ausgeführt haben, und wie wir alles nutzen können, einschliesslich der Synchronisierung und gemeinsamen Nutzung von Dateien sowie des E-Mail-Programms.

### Szenario 7: Kostenoptimierung

- Unsere Präferenz liegt auf kosteneffizienten Lösungen. Das schliesst die Verwendung von Zertifikaten von Let's Encrypt, zertifikatslosen Programmen und stromsparenden Anwendungen mit ein.

# Hauptteil - Aufsetzen der Umgebung

## Vorbereitung

### Welche Services werden wir benötigen?

Ich habe von meinem Kunden viele Akzeptanzkriterien erhalten, diese wären hauptsächlich:
- Share und Sync Server
- Mail Server
- Domain mit TLS
- stromsparende Anwendungen
- Regelmässige Updates

Da wir eine Domain haben brauchen wir also auch einen Reverse Proxy. Und da alles Stromsparend sein sollte habe ich mich entschieden eine komplette Docker Umgebung zu erstellen, weil diese über einen Hypervisor Typ 2 funktionieren und so nicht ineffiznente VMs gebraucht sind. Auch kann man mithilfe von `docker-compose.yml` alles in einer Config Datei einfügen und so sehr einfach Dokumentieren und erlkären. Sowie auch das migrieren zu einem strärkeren Server wer sehr einfach zu lösen.

### Für welche Services werden wir uns entscheiden

#### Reverse Proxy

Ich finde den Reverse Proxy am wichtigsten also fangen wir damit an, durch meienr recherche gibt es hier 2 gute Optionen.
- Nginx Reverse Proxy
- Traefik

Hier habe ich diese vergleichstabelle erstellt.

| Funktion                    | Nginx                          | Traefik                             |
| --------------------------- | ------------------------------ | ----------------------------------- |
| Lastenausgleich             | Ja                             | Ja                                  |
| Dynamische Konfiguration    | Nein (manuelle Aktualisierung) | Ja (Echtzeitaktualisierung)         |
| Service Discovery           | Manuell                        | Integriert (Docker)                 |
| Automatisches Let's Encrypt | Nein                           | Ja (integrierte ACME-Unterstützung) |
| Dashboard und Überwachung   | Nein                           | Ja (Web-Oberfläche und API)         |
| Benutzerfreundlichkeit      | Mässig bis Hoch                | Gering bis Mässig                   |
| Hohe Verfügbarkeit          | Ja                             | Ja                                  |
| Leistung                    | Hohe Leistung                  | Hohe Leistung                       |

Ich selber habe mich also für Traefik entschieden.

#### Share und Sync Server

Da wir eine Docker Umgebung haben, habe ich mich für OwnCloud entschieden.

#### Mail Server

asdf

#### Update Server

Ich habe viele recherchen gemacht und heraus gefunden, dass man mit Watchtower seine Container regelmässig upgraden kann. Dies kann man mit Cronjobs definieren.

Bei unserer User-Story wurde gesagt, dass wir jeden Freitag Abend um 20:00 unsere systeme upgraden sollten.

Also habe ich diese `docker-compose.yml` Datei zusammen gemacht:

```yml
version: "3.8"

services:
  watchtower:
    image: containrrr/watchtower:latest
    container_name: watchtower
    networks:
      proxy:
        ipv4_address: 172.16.0.6
    environment:
      - TZ=Europe/Zurich
      - WATCHTOWER_INCLUDE_STOPPED=true
      - WATCHTOWER_REVIVE_STOPPED=false
      - WATCHTOWER_RUN_ONCE=false
      - WATCHTOWER_CLEANUP=true
      - WATCHTOWER_SCHEDULE=0 0 20 * * 5
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: on-failure

networks:
  proxy:
    external: true
```

#### Domain

Ich habe schon die Domain `sulejmani.xyz` auf Cloudflare und werden dies für die Laborumgebung brauchen. bzw. die Sub-Domain `tbz.sulejmani.xyz`

## Umsetzen



## Testen



# Reflektion

## Speicherkapazität

Die Speicherkapazität ist für den zukünftigen Speicherzuwachs mit konkreten Werten berechnet (Beispiel für Berechnung mit Tool: Backup Capacity Calculator - WintelGuy.com)
