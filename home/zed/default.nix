{ config, lib, ... }:

let
  settingsSource = "${config.home.homeDirectory}/nixos/home/zed/settings.json";
  settingsDir = "${config.xdg.configHome}/zed";
in
{
  # Zed saves UI changes to the resolved path, so link directly to the checkout.
  home.activation.linkZedSettings = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    zedSettingsSource=${lib.escapeShellArg settingsSource}
    zedConfigDir=${lib.escapeShellArg settingsDir}
    zedSettingsTarget="$zedConfigDir/settings.json"
    if [[ ! -f "$zedSettingsSource" ]]; then
      warnEcho "Zed settings source is missing: $zedSettingsSource"
    elif [[ "$(readlink -- "$zedSettingsTarget")" != "$zedSettingsSource" ]]; then
      run mkdir -p -- "$zedConfigDir"
      run ln -sT --backup=numbered -- "$zedSettingsSource" "$zedSettingsTarget"
    fi
    unset zedSettingsSource zedConfigDir zedSettingsTarget
  '';
}
