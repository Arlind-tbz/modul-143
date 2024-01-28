# Modul 143 - Backup- und Restore-Systeme implementieren

Willkommen zu meinem Repostiory zum "Modul 143 - Backup- und Restore-Systeme implementieren"

- [Kompetenzmatrix](./Kompetenzmatrix.MD)
- [Punktebewertung Praxisarbeit mit Erklärungen](./src/M143-Punktebewertung-Praxisarbeit-mit-Erklärungen.pdf)
- [Selbsteinschätzung](./Selbsteinschaetzung.md)
- [Dockerfiles](./docker/)

# Inhaltsverzeichnis

- [Modul 143 - Backup- und Restore-Systeme implementieren](#modul-143---backup--und-restore-systeme-implementieren)
- [Inhaltsverzeichnis](#inhaltsverzeichnis)
- [Einleitung](#einleitung)
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
      - [Backup und Restore](#backup-und-restore)
  - [Umsetzen](#umsetzen)
    - [Traefik (Reverse Proxy)](#traefik-reverse-proxy)
    - [Watchtower (Update Server)](#watchtower-update-server)
    - [OwnCloud (Share und Sync Server)](#owncloud-share-und-sync-server)
    - [Mailu (Mail Server)](#mailu-mail-server)
    - [Backup und Restore Script](#backup-und-restore-script)
  - [Testen](#testen)
- [Reflektion](#reflektion)
  - [Speicherkapazität](#speicherkapazität)


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
- Backup und Restore

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

Ich folge Philipp Rohrs Empfehlung für den Share und Sync Server. Statt NextCloud oder ähnliches, wähle ich OwnCloud, eine Docker-basierte Lösung, die ähnliche Funktionen bietet.

#### Mail Server

Bei der Auswahl des Mail Servers standen mir zwei Optionen zur Verfügung: MailCow und Mailu. Nach meinen Tests habe ich festgestellt, dass Mailu weniger CPU-Leistung und RAM benötigt. Um eine performante Lösung zu gewährleisten, die auch zukünftig mit mehreren Benutzern funktioniert, habe ich mich für Mailu entschieden.

#### Update Server

Ich habe viele recherchen gemacht und heraus gefunden, dass man mit Watchtower seine Container regelmässig upgraden kann. Dies kann man mit Cronjobs definieren.

Bei unserer User-Story wurde gesagt, dass wir jeden Freitag Abend um 20:00 unsere systeme upgraden sollten.

#### Domain

Ich habe schon die Domain `sulejmani.xyz` auf Cloudflare und werden dies für die Laborumgebung brauchen. bzw. die Sub-Domain `tbz.sulejmani.xyz`

#### Backup und Restore

Für das Backup und Restore werde ich Bash verwenden.

Zunächst werde ich ein Bash-Skript erstellen, das alles korrekt sichert. Es wird drei Kopien auf zwei verschiedenen Medien erstellen und eine Kopie in der Cloud speichern.

Für die Wiederherstellung werde ich eine Auswahlmöglichkeit implementieren, von wo aus der Restore durchgeführt werden soll, zum Beispiel Remote, von der Festplatte (HDD) oder von Band (Tape).

## Umsetzen

Zuerst habe ich natürlich schon eine Ubuntu Server Umgebung, ich gehe jetzt nicht durch, wie man Ubuntu auf einem Server installiert, da es dafür schon genug Anleitungen gibt. Das gleiche auch für Docker installationen.

Falls man dies braucht gibt es aber diese Anleitungen:

- [Ubuntu Installation](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)
- [Docker Installation](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

zuerst gehen wir bei unserer lokalen Benutzer und wählen wo wir unserer Umgebung haben möchten. In meinem Fall entscheide ich mich für `~/docker`. Ausgeschrieben wäre das `/home/arlind/docker` für mich.

### Traefik (Reverse Proxy)

Normalerweise würden wir den Ordner manuell erstellen, aber ich habe ein Skript erstellt, das einige Dinge für uns vereinfacht.

```bash
#!/bin/bash

mkdir -p owncloud/data traefik/data owncloud/mysql owncloud/redis

docker network create --driver bridge --gateway 172.16.0.1 --ip-range 172.16.0.0/24 --subnet 172.16.0.0/16 proxy

cat > /home/arlind/docker/traefik/data/traefik.yml <<EOF
api:
  dashboard: true
  debug: true
entryPoints:
  http:
    address: ":80"
    http:
      redirections:
        entryPoint:
          to: https
          scheme: https
  https:
    address: ":443"
serversTransport:
  insecureSkipVerify: true
providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false
  file:
    filename: /config.yml
certificatesResolvers:
  cloudflare:
    acme:
      email: yourcloudflare@email.com
      storage: acme.json
      dnsChallenge:
        provider: cloudflare
        resolvers:
          - "1.1.1.1:53"
          - "1.0.0.1:53"
EOF

touch /home/arlind/docker/traefik/data/config.yml

sudo chown -R 1000:1000 ./

chmod -R 755 ./

touch /home/arlind/docker/traefik/data/acme.json

chmod 600 /home/arlind/docker/traefik/data/acme.json
```

Dieses Skript ist sehr nützlich, da es alle Berechtigungen richtig setzt und ein Docker-Netzwerk für die anderen Container erstellt. Außerdem erstellt es alle Dateien, die Traefik außer der `docker-compose.yml` Datei benötigt.

Diesen Code können wir sehr einfach herunterladen.

```bash
wget https://raw.githubusercontent.com/Arlind-tbz/modul-143/main/docker/prerequisite.sh?token=GHSAT0AAAAAACIIHYV5GZDTUHMXX5SELKFSZNWUUTQ
```

Sobald wir das Skript haben, können wir die Berechtigungen festlegen und es ausführen.

```bash
chmod +x prerequisite.sh
```

```bash
./prerequisite.sh
```

Jetzt haben wir unsere Ordner erstellt und die Dateien, die wir benötigen.

Als nächstes wechseln wir in das Verzeichnis `./traefik` mit dem Befehl `cd`.

```bash
cd traefik
```

und bearbeiten die Datei `./data/traefik.yml`, ersetzen `yourcloudflare@email.com` durch unsere eigene E-Mail-Adresse.

```bash
vim ./data/traefik.yml # or nano
```

Nun können wir die Compose-Datei erstellen und bearbeiten.

```bash
touch docker-compose.yml
```

```bash
vim docker-compose.yml # or nano
```

Dann fügen wir diesen Code ein.

```yml
version: "3"

services:

  traefik:
    image: traefik:latest
    container_name: traefik
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    networks:
      proxy:
        ipv4_address: 172.16.0.2
    ports:
      - 80:80
      - 443:443
    environment:
      - CF_API_EMAIL=youremail@email.com # ersetzen mit deiner E-Mail
      - CF_DNS_API_TOKEN=yourcloudflareapitoken # ersetzen mit deinem Token ****
    volumes:
      - /etc/localtime:/etc/localtime:ro # Zeit
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./data/traefik.yml:/traefik.yml:ro
      - ./data/traefik.yml:/config.yml:ro
      - ./data/acme.json:/acme.json
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.traefik.entrypoints=http"
      - "traefik.http.routers.traefik.rule=Host(`traefik.tbz.domain.tld`)" # ersetzen mit deiner Domain
      - "traefik.http.middlewares.traefik-auth.basicauth.users=admin:$$apr1$$J9aFUVEo$$ClVOvCnSmf.tisyo8Lj1W/" # Benutzer: arlind Passwort: gn?43uU6g*HGvZ]*&mBp
      - "traefik.http.middlewares.traefik-https-redirect.redirectscheme.scheme=https"
      - "traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto=https"
      - "traefik.http.routers.traefik.middlewares=traefik-https-redirect"
      - "traefik.http.routers.traefik-secure.entrypoints=https"
      - "traefik.http.routers.traefik-secure.rule=Host(`traefik.tbz.domain.tld`)" # ersetzen mit deiner Domain
      - "traefik.http.routers.traefik-secure.middlewares=traefik-auth"
      - "traefik.http.routers.traefik-secure.tls=true"
      - "traefik.http.routers.traefik-secure.tls.certresolver=cloudflare"
      - "traefik.http.routers.traefik-secure.tls.domains[0].main=tbz.domain.tld" # ersetzen mit deiner Domain
      - "traefik.http.routers.traefik-secure.tls.domains[0].sans=*.tbz.domain.tld" # ersetzen mit deiner Domain
      - "traefik.http.routers.traefik-secure.service=api@internal"

networks:
  proxy:
    external: true
```

Cloudflare Tokens können unter diesem Link erstellt werden: https://dash.cloudflare.com/profile/api-tokens. Es ist wichtig, dass das Token die Berechtigung `Zone.DNS` für deine Domain hat.

Sobald wir dies haben, können wir den Docker-Container starten.

```bash
docker compose up -d
```

Um es zu testen, können wir die Logs überprüfen oder direkt auf die Domain gehen, bei der du es definiert hast.

![Traefik-Test](./src/Traefik-test.png)

Wie auf diesem Bild zu sehen ist, funktioniert Traefik bei uns, und das SSL-Zertifikat funktioniert wie es sollte.

### Watchtower (Update Server)

Wie üblich erstellen wir zunächst einen Ordner für die Docker-Umgebung, in diesem Fall wieder für den einzelnen Container.

Das können wir mit folgendem Befehl tun:

```bash
mkdir watchtower
```

Dann wechseln wir in das Verzeichnis `./watchtower` mit dem Befehl `cd`.

```bash
cd watchtower
```

Hier erstellen wir erneut die Datei `docker-compose.yml`.

```bash
touch docker-compose.yml
```

Nun können wir die Datei definieren, damit Watchtower so funktioniert, wie wir es wollen.

```bash
vim docker-compose.yml # oder nano
```

```yml
version: "3.8"
services:
  watchtower:
    image: containrrr/watchtower:latest
    container_name: watchtower
    networks:
      proxy:
        ipv4_address: 172.16.1.1
    environment:
      - TZ=Europe/Zurich # Zeitzone
      - WATCHTOWER_INCLUDE_STOPPED=true # Container die deaktiviert sind werden auch updated.
      - WATCHTOWER_REVIVE_STOPPED=false # Container die deaktiviert sind werden nicht wieder gestartet nach dem restart
      - WATCHTOWER_RUN_ONCE=false # Dies muss gesetzt werden, damit man einen Schedule einsetzen kann.
      - WATCHTOWER_CLEANUP=true # Alte Images werden gelöscht
      - WATCHTOWER_SCHEDULE=0 0 20 * * 5 # Schedule für jeden Freitag um 20:00
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: on-failure

networks: # Netzwerk definieren, damit es im gleichen Netzwerk ist, wie die anderen Container.
  proxy:
    external: true
```

Ich habe diese Datei zusammengestellt und werde sie auch für unsere Docker-Umgebung benötigen.

Sobald wir die Datei gespeichert haben, können wir sie direkt starten.

```bash
docker compose up -d
```

Um zu überprüfen, ob alles funktioniert hat, können wir die Logs anzeigen lassen. Dies können wir mit folgendem Befehl tun:

```bash
docker compose logs -f
```

```bash
level=info msg="Watchtower 1.7.1"
level=info msg="Using no notifications"
level=info msg="Checking all containers (except explicitly disabled with label)"
level=info msg="Scheduling first run: 2024-02-02 20:00:00 +0100 CET"
level=info msg="Note that the first check will be performed in 120 hours, 9 minutes, 40 seconds"
```

Wir sehen, dass alles funktioniert hat, wenn wir keine Fehlermeldungen sehen und Watchtower uns mitteilt, wann das nächste Update durchgeführt wird.

### OwnCloud (Share und Sync Server)

### Mailu (Mail Server)

### Backup und Restore Script


## Testen



# Reflektion

## Speicherkapazität

Die Speicherkapazität ist für den zukünftigen Speicherzuwachs mit konkreten Werten berechnet (Beispiel für Berechnung mit Tool: Backup Capacity Calculator - WintelGuy.com)
