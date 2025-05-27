# GNOME Tweaks

Run the following to install GNOME Tweaks:

```
sudo dnf install gnome-tweaks -y
```

- Fonts
  - Interface Text: SF Pro Text Regular
  - Document Text: SF Pro Text Regular
  - Monospace Text: SF Mono Regular
  - Antialiasing: Subpixel (for LCD screens)
- Window Titlebars
  - Titlebar Actions
    - Double-Click: None
    - Middle-Click: None
- Windows
  - Window Action Key: Alt
  - Resize with Secondary-Click: On
  - Window Focus: Focus on Hover
    - Raise Windows When Focused: On

Move the contents of `conf/tweaks/` to `.themes/` after following the instructions in `sf-font.md`, and change the following setting:

Download the Mocu cursor by sevmeyer from [here](https://www.gnome-look.org/p/1526606). Unzip, and move the `Mocu-Black-Right` folder to `~/.icons/`. Create this folder if it does not already exist.

- Appearance
  - Themes
    - Cursor: Mocu-Black-Right
    - Shell: Choose light-top-bar, dark-top-bar, or invisible-top-bar
    - Legacy Applications: Adwaita-dark (only if you want dark theme)    
