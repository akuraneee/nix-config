# NixOS для ПК и ноутбука

Обе машины используют общие пакеты, GNOME и Home Manager. Хост `nixos` сохраняет настройки ПК, а `laptop` использует Intel для рабочего стола и NVIDIA MX150 через PRIME Offload. Чтобы запустить приложение на MX150, используй `nvidia-offload <программа>`. В Steam в параметрах запуска игры можно указать `nvidia-offload %command%`.

## ПК

Из репозитория в `~/nixos`:

```sh
sudo nixos-rebuild switch --flake "$HOME/nixos#nixos"
```

## Ноутбук

Профиль рассчитан на UEFI, EFI-раздел FAT32 в `/boot` и корневую Btrfs внутри LUKS2. При загрузке initrd на базе systemd разблокирует контейнер до монтирования корня.

В уже установленном NixOS с такой разметкой склонируй репозиторий в `~/nixos` и сгенерируй конфигурацию оборудования на ноутбуке:

```sh
cd ~/nixos
sudo nixos-generate-config --show-hardware-config > hosts/laptop/hardware-configuration.nix
git add -- hosts/laptop/hardware-configuration.nix
lspci -nn | grep -Ei 'VGA|3D|Display'
```

Git должен видеть файл оборудования, чтобы включить его во flake. Для локальной сборки достаточно `git add`.

Проверь сгенерированный файл. В `boot.initrd.luks.devices.<имя>.device` должен быть путь к контейнеру по UUID LUKS. В `fileSystems."/"` должен быть `fsType = "btrfs"` и путь к разблокированному устройству (`/dev/mapper/<имя>` или путь по UUID самой Btrfs). Для существующих подтомов сохрани сгенерированные параметры `subvol=` и точки монтирования. Версию контейнера можно проверить командой `sudo cryptsetup luksDump /dev/disk/by-uuid/<UUID-LUKS>` в поле `Version`.

При новой установке из live-системы сначала разблокируй подготовленный контейнер и смонтируй корень и подтома в `/mnt`, а EFI-раздел в `/mnt/boot`. Из каталога репозитория сгенерируй конфигурацию командой `sudo nixos-generate-config --root /mnt --show-hardware-config > hosts/laptop/hardware-configuration.nix`, проверь её, добавь файл через `git add` и запусти `sudo nixos-install --flake .#laptop`. Если текущий корень ещё не зашифрован, перед применением профиля потребуется перенести его на подготовленный том LUKS2 с Btrfs.

В `hosts/laptop/configuration.nix` заданы типичные PCI-адреса `00:02.0` для Intel и `01:00.0` для NVIDIA. Если вывод `lspci` отличается, исправь `intelBusId` и `nvidiaBusId`. Например, `02:00.0` записывается как `PCI:2:0:0`. Сохрани `system.stateVersion` из прежней конфигурации ноутбука. Если на ноутбуке другой загрузчик или точка монтирования EFI, перенеси соответствующие параметры `boot.loader` в конфигурацию ноутбука перед первой загрузкой.

```sh
sudo nixos-rebuild boot --flake "$HOME/nixos#laptop"
```

После перезагрузки используй `sudo nixos-rebuild switch --flake "$HOME/nixos#laptop"`. Если `/etc/nixos` уже указывает на этот репозиторий, обычный `sudo nixos-rebuild switch` будет выбирать конфигурацию по имени машины. Явный `--flake` позволяет собирать с текущим симлинком.
