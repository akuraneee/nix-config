# NixOS для ПК и ноутбука

Обе машины используют общие пакеты, GNOME и Home Manager. Хост `nixos` сохраняет настройки ПК, а `laptop` использует Intel для рабочего стола и NVIDIA MX150 через PRIME Offload. Чтобы запустить приложение на MX150, используй `nvidia-offload <программа>`. В Steam в параметрах запуска игры можно указать `nvidia-offload %command%`.

## ПК

Из репозитория в `~/nixos`:

```sh
sudo nixos-rebuild switch --flake "$HOME/nixos#nixos"
```

## Ноутбук

Шаги рассчитаны на уже установленный NixOS, загруженный в UEFI. Склонируй этот репозиторий в `~/nixos` и один раз сгенерируй конфигурацию оборудования на самом ноутбуке:

```sh
cd ~/nixos
sudo nixos-generate-config --show-hardware-config > hosts/laptop/hardware-configuration.nix
git add -- hosts/laptop/hardware-configuration.nix
lspci -nn | grep -Ei 'VGA|3D|Display'
```

Git должен видеть файл оборудования, чтобы включить его во flake. Для локальной сборки достаточно `git add`.

В `hosts/laptop/configuration.nix` заданы типичные PCI-адреса `00:02.0` для Intel и `01:00.0` для NVIDIA. Если вывод `lspci` отличается, исправь `intelBusId` и `nvidiaBusId`. Например, `02:00.0` записывается как `PCI:2:0:0`. Сохрани `system.stateVersion` из прежней конфигурации ноутбука. Если на ноутбуке другой загрузчик или точка монтирования EFI, перенеси соответствующие параметры `boot.loader` в конфигурацию ноутбука перед первой загрузкой.

```sh
sudo nixos-rebuild boot --flake "$HOME/nixos#laptop"
```

После перезагрузки используй `sudo nixos-rebuild switch --flake "$HOME/nixos#laptop"`. Если `/etc/nixos` уже указывает на этот репозиторий, обычный `sudo nixos-rebuild switch` будет выбирать конфигурацию по имени машины. Явный `--flake` позволяет собирать с текущим симлинком.
