# Betriebsdokumentation

Dies ist eine Betriebsdokumentation zu unserer Backup-docker Umgebung. In dieser Dokumentation werden alle wichtige dinge gezeigt, die für einen Systemadministrator wichtig sind.

## Inhaltsverzeichnis

- [Betriebsdokumentation](#betriebsdokumentation)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [Backup](#backup)
  - [Restore](#restore)
  - [Watchtower](#watchtower)
  - [OwnCloud](#owncloud)
  - [Mail](#mail)


## Backup

Jeden Freitag um 17:00 werden Backups erstellt, mithilfe von einem Cronjob.

Der Cronjob sieht aus wie folgt:

```bash
0 17 * * 5 /bin/bash /home/arlind/docker/backup.sh
```

Es wird dieser Script ausgeführt:

```bash
#!/bin/bash
timestamp=$(date +%Y_%m_%d-%H_%M_%S)
log_dir="/var/log/tbz"
log_file1="$log_dir/${timestamp}_backup-hdd.log"
log_file2="$log_dir/${timestamp}_backup-tape.log"
log_file_remote="$log_dir/${timestamp}_backup-remote.log"
mkdir -p "$log_dir"
exec > >(tee -a "$log_file1") 2>&1
source_dir="/home/arlind/docker/"
local_backup_dir1="/home/arlind/backup-hdd"
local_backup_dir2="/home/arlind/backup-tape"

# Perform the first local backup using rsync and log the output
rsync -avh --delete "$source_dir" "$local_backup_dir1"
exec > >(tee -a "$log_file2") 2>&1

# Perform the second local backup using rsync and log the output
rsync -avh --delete "$source_dir" "$local_backup_dir2"
exec > >(tee -a "$log_file_remote") 2>&1

remote_user="arlind"
remote_host="localhost"
remote_backup_dir="/home/arlind/backup-remote"

rsync -avh --delete -e "ssh -i /home/arlind/.ssh/ssh-key" "$source_dir" "$remote_user@$remote_host:$remote_backup_dir"
```
Dieser Script nimmt alles im Verzeichnis `/home/arlind/docker` und macht eine identische Kopie inklusive berechtigungen und fügt sie in 2 verschiedene Speichermedien und eine Kopie auf der Cloud. In unserem Fall wäre das eine Kopie auf einer HDD, eine Kopie auf einer Tapespeicher und eine Kopie auf der Cloud, vie SSH, damit wir die Daten sicher übertragen.

Die Daten werden nicht verschlüsselt gespeichert, dass müssen sie aber nicht, weil owncloud und mailu Daten verschlüsselt speichern.

Falls ein Backup persofort erstellt werden muss, dann kann man sich direkt mit dem Server per SSH verbinden und im Verzeichnis `/home/arlind/docker` die Datei `backup.sh` ausführen.

Dies kann man mit diesem Befehl machen.

```bash
sudo bash /home/arlind/docker/backup.sh
```

## Restore

Der Restorescript ist sehr simpel, es sind verschiedene `mv` Befehle und eine `scp -r` Befehl.
Doch bevor alles restored wird werden verschiedene sachen gemacht. Zuerst wird ein ./stop.sh ausgeführt, diese Bashscript wird alle relavanten Docker Container herunterfahren.

Nachdem die Container heruntergefahren werden, wird der komplette Ordner gewiped. Dies ist, damit es keine Probleme hat beim restoren.

Danach wählt man die Restore methode und es wird ausgeführt, nach dem alles restored wurde, wird start.sh ausgeführt, dass alle Docker container wieder startet.

```bash
#!/bin/bash

timestamp=$(date +%Y_%m_%d-%H_%M_%S)
log_dir="/var/log/tbz"
log_file1="$log_dir/${timestamp}_restore-hdd.log"
log_file2="$log_dir/${timestamp}_restore-tape.log"
log_file_remote="$log_dir/${timestamp}_restore-remote.log"

remote_user="arlind"
remote_host="localhost"
remote_backup_dir="/home/arlind/backup-remote/*"

bash /home/arlind/docker/stop.sh

echo "Choose a script to execute:"
echo "1. Execute restore from HDD"
echo "2. Execute restore from tape"
echo "3. Execute restore from remote"
read choice

# Function to log messages to the appropriate log file
log_message() {
  local log_file="$1"
  local message="$2"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$log_file"
}

case "$choice" in
  1)
    log_message "$log_file1" "Restoring from HDD"
    rm -rf /home/arlind/docker/mailu
    rm -rf /home/arlind/docker/watchtower
    rm -rf /home/arlind/docker/owncloud
    rm -rf /home/arlind/docker/traefik
    cp -r /home/arlind/backup-hdd/* /home/arlind/docker/
    ;;
  2)
    log_message "$log_file2" "Restoring from tape"
    rm -rf /home/arlind/docker/mailu
    rm -rf /home/arlind/docker/watchtower
    rm -rf /home/arlind/docker/owncloud
    rm -rf /home/arlind/docker/traefik
    cp -r /home/arlind/backup-tape/* /home/arlind/docker/
    ;;
  3)
    log_message "$log_file_remote" "Restoring from remote"
    rm -rf /home/arlind/docker/mailu
    rm -rf /home/arlind/docker/watchtower
    rm -rf /home/arlind/docker/owncloud
    rm -rf /home/arlind/docker/traefik
    scp -r -i /home/arlind/.ssh/ssh-key "$remote_user@$remote_host:$remote_backup_dir" /home/arlind/docker/ >> "$log_file_remote" 2>&1
    ;;
  *)
    log_message "$log_file1" "Invalid choice. Please enter 1, 2, or 3."
    ;;
esac

bash /home/arlind/docker/start.sh
```

Wie immer muss man sich zuerst mit SSH auf dem Server verbinden. Im Verzeichnis `/home/arlind/docker` gibt es eine Datei namens `restore.sh` diese kann man ohne andere Arguments ausführen. Sobald man den Script ausführt mit diesem Befehl:

```bash
sudo bash /home/arlind/docker/restore.sh
```
Wird ein Fenster auftauchen, dass sie auswählen lässt, von wo es einen restore ausführt. 1. wäre HDD 2. wäre Tape und 3. wäre Remote.

Hier wäre ein Beispiel:

```bash
sudo ./restore.sh
Choose the backup destination:
1. HDD
2. Tape
3. Remote
Enter your choice (1/2/3): 1
```
Sobald die Auswahl getroffen wurde und Enter gedrückt wird, sieht man alle Logs während es den Restore ausführt.

## Watchtower

## OwnCloud

## Mail
