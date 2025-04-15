# VSCodium

Install VSCodium with the following commands in terminal:

```
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium -y
```

Click "Mark as done", then disable "Show welcome page on startup" on the new page.

Change the following settings:

- Text Editor
  - Accept Suggestion On Enter: Off
  - Line Numbers: relative
  - Scrollbar: Horizontal: hidden
  - Scrollbar: Vertical: hidden
  - Detect Indentation: Off
  - Inlay Hints: Off
  - Sticky Scroll: Off
  - Tab Completion: On
  - Tab Size: 2
  - Word Wrap: On
  - Wrapping Indent: indent
  - Font
    - Font Family: Insert `'SF Mono', ` at the beginning after following the instructions in `sf-font.md`
    - Font Size: 12
  - Formatting
    - Format On Paste: On
    - Format On Save: On
  - Minimap
    - Max Column: 30
    - Render Characters: Off
    - Show Slider: always
    - Side: left
    - Size: fit
- Workbench
  - Breadcrumbs
    - Enabled: Off
  - View
    - Show Quietly: On
  - Zen
    - Hide Line Numbers: Off
    - Show tabs: none
- Window
  - Auto Detect Color Scheme: On
- Features
  - Source Control
    - Diff Decorations Gutter Width: 1
  - Terminal
    - Integrated: Font Family: `'SF Mono'`
    - Integrated: Font Size: 13
- HTML
  - Format: Wrap Line Length: 0
  - Auto Closing Tags: Off
  - Auto Create QUotes: Off

Install the Fedora GNOME light & dark themes extension by olifink, and change the following settings:

- Workbench
  - Appearance
    - Color Theme: Gnome Light (GitHub)
    - Preferred Dark Color Theme: Gnome Dark (GitHub)
    - Preferred Light Color Theme: Gnome Light (GitHub)

Install the following extensions:

- Active File In StatusBar by RoscoP
- Bash IDE by mads-hartmann
- Codeium: AI Coding Autocomplete and Chat for Python, Javascript, Typescript, Java, God, and more by Codeium
- Dart by Dart-Code
- Error Lens by usernamehw
- Flutter by Dart-Code
- Live Server by ritwickdey
- Python by ms-python
- ShellCheck by timonwong.
- VSCode Neovim extension by asvetliakov
- clangd by llvm-vs-code-extensions (install clangd when propted; you may have to open a .cpp file first in which case also press `Ctrl+Shift+P` and enter "clangd: Toggle inlay hints")
- statusbar-commands by anweber
- Indent one space by SirTori

Open the Codeium website when prompted, sign in, close the notification in VSCodium, and open the website when prompted again. Copy the authentication token, and the press `CTRL-P` in VSCodium, then search for `Codeium: Provide Authentication Token`. Paste the copied token and press enter.

Also install shfmt by mkhl. Then, run `go install mvdan.cc/sh/v3/cmd/shfmt@latest` to install the dependency. The directory `~/go/bin/` may need to be added to your PATH if it is not already.

Select View from the top bar, and under Appearance, disable the Menu Bar.

Press `Ctrl+Shift+P` and enter "Open User Settings (JSON)." Then, add a comma to the last entry before the closing curly brace, and add the following after:

```
    "workbench.colorCustomizations": {
        "editorOverviewRuler.addedForeground": "#0000",
        "editorOverviewRuler.bracketMatchForeground": "#0000",
        "editorOverviewRuler.commentForeground": "#0000",
        "editorOverviewRuler.commentUnresolvedForeground": "#0000",
        "editorOverviewRuler.commonContentForeground": "#0000",
        "editorOverviewRuler.currentContentForeground": "#0000",
        "editorOverviewRuler.deletedForeground": "#0000",
        "editorOverviewRuler.errorForeground": "#0000",
        "editorOverviewRuler.findMatchForeground": "#0000",
        "editorOverviewRuler.incomingContentForeground": "#0000",
        "editorOverviewRuler.infoForeground": "#0000",
        "editorOverviewRuler.inlineChatInserted": "#0000",
        "editorOverviewRuler.inlineChatRemoved": "#0000",
        "editorOverviewRuler.modifiedForeground": "#0000",
        "editorOverviewRuler.rangeHighlightForeground": "#0000",
        "editorOverviewRuler.selectionHighlightForeground": "#0000",
        "editorOverviewRuler.warningForeground": "#0000",
        "editorOverviewRuler.wordHighlightForeground": "#0000",
        "editorOverviewRuler.wordHighlightStrongForeground": "#0000",
        "editorOverviewRuler.wordHighlightTextForeground": "#0000"
    },
    "statusbar_command.commands": [
        {
            "text": "$(folder)",
            "tooltip": "Open Containing Folder",
            "id": "sbc_folder",
            "name": "sbc_folder",
            "priority": 1,
            "alignment": "left",
            "command": "revealFileInOS"
        },
        {
            "text": "$(gear)",
            "tooltip": "Open User Settings",
            "id": "sbc_settings",
            "name": "sbc_settings",
            "priority": 1,
            "alignment": "right",
            "command": "workbench.action.openWorkspaceSettings"
        },
        {
            "text": "$(book)",
            "tooltip": "Toggle Zen Mode",
            "id": "sbc_zen",
            "name": "sbc_zen",
            "priority": 1,
            "alignment": "right",
            "command": "workbench.action.openWorkspaceSettings"
        }
    ]
```

Change the following settings once all plugins have been installed:

- Neovim Viewport Height Extend: 10000

Right click the bottom status bar, and disable the following items:

- Remote Host
- Source Control Publish
- Forwarded Ports
- VSCode Neovim (Extension)
- Editor Indentation
- Editor Encoding
- Editor End of Line
- Editor Language

Change `-1` to `1` in `~/.vscode-oss/extensions/roscop.activefileinstatusbar-1.0.3-universal/extension.js` at this line:

```
var sb = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left, 1);
```

Change the following Indenticator settings:

- Indenticator Inner Width: 0.5
- Indenticator Width: 0.5

Restart VSCodium for some changes to take effect.

Remove the following keybind by rightclicking it in Keyboard Shortcuts (open it by searching it through `Ctrl+Shift+P`)

- workbench.action.quit
- insertSuggestion

Change the following shortcuts:

- selectNextSuggestion: `Ctrl+Down arrow` to `Tab`
- selectPrevSuggestion: `Ctrl+Up arrow` to `Shift+Tab`
- Accept Inline Suggestion (both options): `Tab` to `Ctrl+Enter`
- codeium.supercompleteAccept: `Ctrl+Enter`

Open VSCode Neovim's settings, and add `q` to "Ctrl Keys For Insert Mode" and "Ctrl Keys For Normal Mode"

 Open the user settings JSON, and add the following:

 ```
   "liveServer.settings.ignoreFiles": [
     "**/*.db",
     "**/*.db~",
     "**/*.db-journal",
    ],
```
