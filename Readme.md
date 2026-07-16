# Wallhaven Fetch 
![](https://img.shields.io/badge/version-0.7-orange)

A wallpaper script that pulls wallpapers from wallhaven and integrates with caelestia shell


# Features
- API key integration
- Query, Purity and Category selection
- Json config file ( with comments )
- Interval changes with the daemon
- Dynamic colorscheme updater ( Caelestia shell Integration )



# Usage
```
  wallhaven-fetch random          -  Random from saved filters
  wallhaven-fetch daemon          -  Daemon mode (auto-rotate)
  wallhaven-fetch search <query>  -  Search Wallhaven
  wallhaven-fetch download <id>   -  Download by ID
  wallhaven-fetch clear           -  Wipe downloaded wallpapers & cache
  wallhaven-fetch config          -  Open config file
  wallhaven-fetch external-daemon -  Daemon mode (auto-rotate) (external mode)
```

The caelestia shortcut is **SUPER + ALT + W**

The daemon runs periodically based on the interval you set in the config, if you
want the daemon to automatically start with your computer, you can add this to your
*hypr-user.lua*

```lua
hl.on("hyprland.start", function()
  hl.exec_cmd("wallhaven-fetch daemon")
end)
```


The external daemon can be used with systemd timers or cronjobs
*PS: if you don't know how to use these, stick with the normal daemon*



# Installation
Clone the repo and run the install script

**OR**

```bash
curl -sSL https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/install.sh | bash
```

## Update

```bash
curl -sSL https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/update.sh | bash
```

## Uninstall

Run the uninstall script

**OR**

```bash
curl -sSL https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/uninstall.sh | bash
```

