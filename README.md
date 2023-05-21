## <img src="https://images.emojiterra.com/google/noto-emoji/unicode-15/animated/1f985.gif" width ="50"><b> Falcon</b><br>

Falcon is a bash tool, with its intuitive interface and advanced feature set. Falcon allows you to evaluate the security of your own WiFi networks and search for vulnerabilities in web pages

> Falcon is a tool designed for both computer security enthusiasts and professionals in the field. However, always remember to use Falcon ethically and responsibly, and make sure you get proper consent before testing on third-party networks.

> Download Falcon today and take your WiFi network security skills to the next level. Protect your connection and keep potential intruders at bay with the powerful Falcon tool!

## Screenshot

[![falcon.png](https://i.postimg.cc/0j6vLW2N/falcon.png)](https://postimg.cc/hQqNm0mF)

## Characteristics

- It automates the capture of handshakes to later crack encryption keys using brute force attacks.
- Sleek, easy-to-use command-line interface streamlines the security assessment process.
- It carries out attacks on WiFi networks using the aircrack-ng and mdk tools.
- Carry out attacks on websites, checking for vulnerabilities with nmap scripts.
- Mass deauthentication attacks, using aircrack-ng and mdk4 and mdk3 tools.
- Scans and reports with nmap, OS detection.

## Install and running

```java
git clone https://github.com/AlvinPix/Falcon.git
cd Falcon
chmod +x falcon.sh
sudo su
exit
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
- macchanger

## Install dependencies

```java
sudo apt install httrack aircrack-ng nmap curl mdk4 mdk3 lsd kitty git macchanger
```
**Some dependencies are not found in the __Debian__ distro repositories**
