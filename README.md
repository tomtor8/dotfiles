# Dotfiles

## Hostname suffixes

- use hostname for machine specific settings
- don't forget to modify the suffixes of files to match your hostname(s)

## btop

- default themes are located at `/usr/share/btop/themes/` directory

## foot

- ready-made themes are located at `/usr/share/foot/themes/` directory

- include your theme in the `foot.ini` like this:

```ini
# from a custom theme
include=~/.local/share/dotfiles/themes/theme_name.ini
# directly from premade themes
include=/usr/share/foot/onedark
```

## GTK applications

### gtk3 and gtk4 css files

- if not already created, create `~/.config/gtk-3.0` and `~/.config/gtk-4.0` directories
- the included script creates links to `gtk.css` and `settings.ini` files in both directories

- don't forget to install `adw-gtk-theme` - read the instructions in your notes repository in the `gtk-theming.md`
