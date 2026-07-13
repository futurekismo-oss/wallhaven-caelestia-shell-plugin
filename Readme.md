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
```


# Installation
Clone the repo and run the install script 

**OR**

```bash 
curl -sSL https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/install.sh | bash
```
## Uninstall

Run the uninstall script

**OR**

```bash 
curl -sSL https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/uninstall.sh | bash
```
