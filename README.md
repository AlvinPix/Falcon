## Falcon

Falcon is a bash tool, with its intuitive interface and advanced feature set. Falcon allows you to evaluate the security of your own WiFi networks and search for vulnerabilities in web pages

## Screenshot

[![falcon.png](https://i.postimg.cc/0j6vLW2N/falcon.png)](https://postimg.cc/hQqNm0mF)

## Characteristics

- It automates the capture of handshakes to later crack encryption keys using brute force attacks.
- Interfaz de línea de comandos elegante y fácil de usar que agiliza el proceso de evaluación de seguridad.
- It carries out attacks on WiFi networks using the aircrack-ng and mdk tools.
- Carry out attacks on websites, checking for vulnerabilities with nmap scripts.

## Install and running

```java
sudo su
exit
git clone https://github.com/AlvinPix/Falcon.git
cd Falcon
chmod +x falcon.sh
./falcon.sh
```

## Supported distributions

| Distribution |   State       |
|--------------|---------------| 
| Kali Linux   | Compatible    |
| Debian       | Compatible    |
| Parrot OS    | Compatible    |

## Dependencies

| Necessary |
|-----------|

- httrack
- aircrack-ng
- nmap
- curl
- mdk4
- mdk3
- lsd
- kitty / terminal
- git

## Install dependencies

```java
sudo apt install httrack aircrack-ng nmap curl mdk4 mdk3 lsd kitty git
```
**Some dependencies are not found in the __Debian__ distro repositories**
