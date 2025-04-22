# Konsole

Run the following to install Konsole:

```
sudo dnf install konsole5 -y
```

Download `github-light.colorscheme` from [here](https://www.pling.com/p/1574065/), and run `mv ~/Downloads/github-light.colorscheme .local/share/konsole/`.

Change the following settings from the menubar:

- Toolbars shown:
  - Main toolbar: Off
  - Session toolbar: Off

Now, change the following settings under Configure Konsole:

- General
  - Process and window
    - Remember window size: Off
    - Remove window titlebar and frame: On
- Profiles
  - Create new and name "Personal"
    - General
      - General Settings
        - Default profile: On
        - Initial terminal size: 84 columns; 30 rows
        - I use 84 columns because the first 4 are taken up by the gutter in my Neovim config
        - Terminal bell mode: System Bell
    - Tabs
      - Tab titles
        - Tab title format: `%w`
    - Appearance
      - Color scheme & font: Github Light
        - Font: SF Mono (after following the instructions in `sf-font.md`) 10.5pt
      - Cursor
        - Blinking > Enabled: On
      - Miscellaneous
        - Terminal contents
          - Margins: 16 px
          -  Window > Show Hint for terminal size after resizing: Off
    - Scrolling
      - Scrollbar position: Hidden
      - Highlighting > Highlight the lines coming into view: Off
    - Mouse
      - Text interaction
        - Copy options
          - Trim leading spaces: On
          - Trim trailing spaces: On
- Tab Bar / Splitters
  - Appearance
    - Show Search Tabs button: Never
    - Show Close Tab Button: None
    - Miscellaneous
      - Expand individual tab widths to full window: On
      - Use user-defined stylesheet: Move the CSS file in `configs/konsole` to `~/.local/share/konsole` and select it for this field
  - Behavior
    - Put new tabs: After current tab
  - This section may need to be completed one more time becuase it resets after exiting

Edit the following keyboard shortcuts from Configure Keyboard Shortcuts:

- New Tab: `Ctrl+T`
- Last Used Tabs: None
- Last Used Tabs (Reverse): None
- Next Tab: `Ctrl+Tab`
- Previous Tab: `Ctrl+Shift+Tab`
- New Window: `Ctr+N`
- Print Screen: `Ctrl+Alt+Shift+P`
- Clear Scrollback and Reset: `Ctrl+L`
- Copy: `Ctrl+C`
- Paste: `Ctrl+V`
- Select All: `Ctrl+A`

Disable Show Menubar from the menubar. Open again when needed with `Ctrl-Shift-M`.
