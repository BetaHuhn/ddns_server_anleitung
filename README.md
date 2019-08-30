# DDNS Server Anleitung

## Installation:

```
git clone https://github.com/arkanis/minidyndns.git
sudo apt install ruby
```

## Einrichtung:
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
