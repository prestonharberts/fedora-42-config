# Visual Studio Code

Install VSCodium with the following commands in terminal:

```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code
```

Run the following to copy the desktop app to your local folder to make some changes to the exec command:

```
cp /usr/share/applications/code.desktop ~/.local/share/applications
vi ~/.local/share/applications/code.desktop
```

Add the following to the end of every line that begins with `Exec` (space included):

```
 --password-store=basic
 ```

Click "Mark as done", then disable "Show welcome page on startup" on the new page.

Sign in using GitHub from the bottom-left corner (click the person icon).

If setting up for first time, change the following settings. Otherwise, everything should be all set.

- Accept Suggestion On Enter: Off
- Line Numbers: relative
- Experimental Edit Context Enabled: On
- Scrollbar: Horizontal: hidden
- Scrollbar: Vertical: hidden
- Detect Indentation: Off
- Inlay Hints: Off
- Smooth Scrolling: On
- Tab Completion: On
- Tab Size: 2
- Word Wrap: On
- Wrapping Indent: indent
- Font Family: Insert `'SF Mono', ` at the beginning after following the instructions in `sf-font.md`
- Font Size: 12
- Format On Paste: On
- Format On Save: On
- Auto Detect Color Scheme: On
- Diff Decorations Gutter Width: 1
- Integrated: Font Family: `'SF Mono'`
- Integrated: Font Size: 13
- Integrated: Send Keybindings To Shell: On
- Minimap
  - Max Column: 30
  - Render Characters: Off
  - Show Slider: always
  - Side: left
  - Size: fit
- View
  - Show Quietly: On
- Zen
  - Hide Line Numbers: Off
  - Show tabs: none
- HTML
  - Format: Wrap Line Length: 0
  - Auto Closing Tags: Off
  - Auto Create Quotes: Off
- Javascript
  - Auto Closing Tags: Off
- TypeScript
  - Auto Closing Tags: Off
- Telemetry
  - Feedback: Off
  - Telemetry Level: Off
- Git
  - Autofetch: true

Install the Fedora GNOME light & dark themes extension by Oliver Fink, and change the following settings:

- Color Theme: Gnome Light (GitHub)
- Preferred Dark Color Theme: Gnome Dark (GitHub)
- Preferred Light Color Theme: Gnome Light (GitHub)

Install the following extensions:

- Bash IDE by mads-hartmann
- Create by HiDeoo
- Error Lens by usernamehw
- Flutter by Dart-Code
- Live Server by ritwickdey
- Python by ms-python
- ShellCheck by Timon Wang.
- VSCode Neovim extension by Alexey Svetliakov 
- clangd by LLVM (install clangd when propted; you may have to open a .cpp file first in which case also press `Ctrl+Shift+P` and enter "clangd: Toggle inlay hints")
- statusbar-commands by Andreas Weber
- Indenticator by SirTori

Also install shfmt by Martin Kühl. Then, run `go install mvdan.cc/sh/v3/cmd/shfmt@latest` to install the dependency. The directory `~/go/bin/` may need to be added to your PATH if it is not already.

Run the following to install an older version of Neovim to use with the VSCode Neovim extension:

```
go install github.com/asdf-vm/asdf/cmd/asdf@v0.16.0
asdf plugin add neovim https://github.com/richin13/asdf-neovim.git
asdf install neovim 0.9.5
# run this line to verify if installed
# $(asdf where neovim 0.9.5)/bin/nvim
```

Change the following settings:

- Vim
  - Smart Relative Line: On
  - Hlsearch: On
  - Use System Clipboard: On
  - Vimrc Enable: On
  - Neovim Viewport Height Extend: 10000
  - Reveal Cursor Scroll Line: On
  - Neovim Executables Path Linux: `/home/USER/.asdf/installs/neovim/0.9.5/bin/nvim` (replace USER with your user)
- Live Server
  - Host: `localhost`

A startup message appears indicating that you are running an unsupported version of Neovim. This can be ignored, or you can comment out the notification in the source code of VSCode Neovim in `runtime/vscode-neovim.vim` at this section:

```
-- if warn then
-- vim.rpcnotify(vim.g.vscode_channel, "vscode-action", "eval", {
-- args = { "vscode.window.showErrorMessage(args)", table.concat(msgs, " ") },
-- })
```

Press `Ctrl+Shift+P` and enter "Open User Settings (JSON)." Then, add a comma to the last entry before the closing curly brace, and add the following after:

```
  "editor.experimentalEditContextEnabled": true,
  "editor.smoothScrolling": true,
  "editor.hideCursorInOverviewRuler": true,
  "editor.overviewRulerBorder": false,
  "workbench.colorCustomizations": {
    "editorOverviewRuler.addedForeground": "#0000",
    "editorOverviewRuler.border": "#0000",
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
  ],
  "liveServer.settings.AdvanceCustomBrowserCmdLine": "google-chrome --password-store=basic"

```

Right click the bottom status bar, and disable the following items:

- Remote Host
- Source Control Publish
- Forwarded Ports
- VSCode Neovim (Extension)
- Editor Indentation
- Editor Encoding
- Editor End of Line
- Indenticator (Extension)

Change `-1` to `1` in `~/.vscode-oss/extensions/roscop.activefileinstatusbar-1.0.3-universal/extension.js` at this line:

```
var sb = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left, -1);
```

Change the following Indenticator settings:

- Indenticator Inner Width: 0.5
- Indenticator Width: 0.5

Restart VSCodium for some changes to take effect.

Remove the following keybind by rightclicking it in Keyboard Shortcuts (open it by searching it through `Ctrl+Shift+P`)

- workbench.action.quit
- insertNextSuggestion
- insertPrevSuggestion
- workbench.action.quickOpenNavigateNextInEditorPicker
- workbench.action.quickOpenNavigatePreviousInEditorPicker
- workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup
- workbench.action.quickOpenNavigatePreviousInEditorPicker
- workbench.action.focusFirstEditorGroup
- workbench.action.focusSecondEditorGroup
- workbench.action.focusThirdEditorGroup
- workbench.action.focusFourthEditorGroup
- workbench.action.focusFifthEditorGroup
- workbench.action.focusSixthEditorGroup
- workbench.action.focusSeventhEditorGroup
- workbench.action.focusEightEditorGroup
- workbench.action.zoomIn
- workbench.action.zoomOut
- workbench.action.focusSideBar

Change the following shortcuts:

- selectNextSuggestion: `Ctrl+Down arrow` to `Tab`
- selectPrevSuggestion: `Ctrl+Up arrow` to `Shift+Tab`
- Accept Inline Suggestion (both options): `Tab` to `Ctrl+Enter`
- codeium.supercompleteAccept: `Ctrl+Enter`
- Terminal: Select All: `Shift+Ctrl+A`
- workbench.action.nextEditorInGroup: `Ctrl+Tab`
- workbench.action.previousEditorInGroup: `Ctrl+Shift+Tab`
- workbench.action.focusAboveGroup: `Alt+K`
- workbench.action.focusBelowGroup: `Alt+J`
- workbench.action.focusLeftGroup: `Alt+H`
- workbench.action.focusRightGroup: `Alt+L`
- workbench.action.closeEditorsInGroup: `Ctrl+Shift+W`
- workbench.action.closeActiveEditor: `Ctrl+W`
- workbench.files.action.saveAllInGroup: `Ctrl+Shift+S`
- workbench.action.newGroupAbove: `Shift+Alt+K`
- workbench.action.newGroupBelow: `Shift+Alt+J`
- workbench.action.newGroupLeft: `Shift+Alt+H`
- workbench.action.newGroupRight: `Shift+Alt+L`
- create.newFromCurrent: `Ctrl+N`
- create.new: `Ctrl+Shift+N`
- editor.foldLevel1: `Ctrl+1`
- editor.foldLevel2: `Ctrl+2`
- editor.foldLevel3: `Ctrl+3`
- editor.foldLevel4: `Ctrl+4`
- editor.foldLevel5: `Ctrl+5`
- editor.foldLevel6: `Ctrl+6`
- editor.foldLevel7: `Ctrl+7`
- editor.fold: `Ctrl+[`
- editor.foldAll: `Ctrl+Shift+[`
- editor.unfold: `Ctrl+]`
- editor.unfoldAll: `Ctrl+Shift+]`
- editor.action.fontZoomOut: `Ctrl+-`
- editor.action.fontZoomIn: `Ctrl+=`
- editor.action.fontZoomReset: `Ctrl+0`
- vscode-neovim.restart: `Ctrl+Alt+Shift+/`

Open VSCode Neovim's settings, and add `q` to "Ctrl Keys For Insert Mode" and "Ctrl Keys For Normal Mode". Remove the following for both normal and insert mode:

- `w`

 Open the user settings JSON, and add the following:

 ```
   "liveServer.settings.ignoreFiles": [
     "**/*.db",
     "**/*.db~",
     "**/*.db-journal",
    ],
```

Right click the titlebar and enable "Restore native titlebar". Restart, then right-click again and enable "Hide custom titlebar". Under View/Appearance, hide Menu Bar.

Click the Copilot icon at the bottom and set up. Allow signing it into GitHub. Press `Ctrl+Shift+P` and serach Manage Copilot. Change the following settings:

- Features
  - Copilot can search the web: Enabled
  - OpenAI GPT-4.1 in Copilot: Enabled
- Privacy
  - Allow GitHub to use my data for product improvements: Off

If Neovim is stuck syncing layouts, run the following to build from source:

```
cd ~/Repos
git clone https://github.com/vscode-neovim/vscode-neovim
cd vscode-neovim
npm install
npm run build
```

Install the .vsix from Visual Studio Code.
