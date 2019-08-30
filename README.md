# DDNS Server Anleitung

## Installation:

```
git clone https://github.com/arkanis/minidyndns.git
sudo apt install ruby
```

## Server Einrichtung:
```
cd minidyndns
sudo cp config.example.yml config.yml
sudo nano config.yml
```
![Image](image1.jpg)
![Image](image2.jpg)
![Image](image3.jpg)

- Domain ändern
-	IP Adressen festlegen 
-	Falls https benötigt Zertifikat und Private Key angeben, falls nicht auf „false“ ändern
-	Benutzer festlegen
-	Domain des Nameservers festlegen

```
sudo cp db.example.yml db.yml
sudo nano config.yml
```
![Image](image4.jpg)
-	Einzelne Benutzer mit eigenen Benutzer Daten anlegen
-	Username festlegen (hier: itm)
-	Passwort festlegen (hier test123)
-	A und AAAA record muss nicht festgelegt werden, kann auch später durch den Client über den http Server gesetzt werden

## DNS records ändern:
- Type;  Hostname; Value
- `NS` `dyn.betahuhn.de` `ns.betahuhn.de`
- `A`  `ns.betahuhn.de` `ipadress`

## Benutzung:
### Server starten:
`sudo ruby dns.rb`
### Probleme beim starten:
```
sudo chown username: db.yml
sudo chmod u+w db.yml
```
### HTTP Interface:
Die IP eines Clients kann über den http Server geändert werden, dazu muss über HTML basic Auth der Username und das Passwort angegeben werden. Bsp.:
`https://username:password@betahuhn.de:2000/?myip=IPADRESS`
Es kann auch die aktuellen IP des Clients als update benutzt werden:
`https://username:password@betahuhn.de:2000` (ohne /?myip=)

### Testen:
`nslookup pi.dyn.betahuhn.de`

### Automatic update:
- `curl -u username:password https://betahuhn.de:2000/?myip=IPADRESS`
- or file: `./update_ip.sh`
- Add to cron: `sudo crontab -e`
```
*/30 * * * * /home/pi/update_ip.sh > /dev/null 2>&1
```

