# Pop!_OS Config


## Boot into Windows

* [Boot into windows icon PopOS!](https://chatgpt.com/c/68b06fb7-009c-8329-950d-c193473c2baa)

User needs to be in sudo group

```sh
sudo usermod -aG sudo nino
sudo usermod -aG sudo dewin
```

```sh
# List boot entries
sudo efibootmgr
```

Create script at `/usr/local/bin/reboot-windows`
```sh
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

sudo efibootmgr -n 0000
sudo reboot

```

```sh
chmod +x /usr/local/bin/reboot-windows
```


`sudo EDITOR=nvim visudo`
```sh
nino ALL=(ALL) NOPASSWD: /usr/local/bin/reboot-windows, /usr/bin/efibootmgr, /user/sbin/reboot
dewin ALL=(ALL) NOPASSWD: /usr/local/bin/reboot-windows, /usr/bin/efibootmgr, /user/sbin/reboot
```


Add desktop entry
```
[Desktop Entry]
Name=Windows
Comment=Reboot the system into Windows
Exec=/usr/local/bin/reboot-windows
Icon=system-reboot
Terminal=true
Type=Application
Categories=System;
```

Dewin's computer is not running with UEFI so efibootmgr does not work. Have to update BIOS.

* [eifbootmgr failing](https://chatgpt.com/c/68b1970a-45dc-8332-b828-8d08a8645cc3)


## Upgrade to Windows 11

I need to go through and try to upgrade to Windows 11 on all computers.
