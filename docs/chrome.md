# Chrome

Run the following to install Chrome:

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf localinstall ./google-chrome-stable_current_x86_64.rpm
```

Run the following to copy the desktop app to your local folder to make some changes to the exec command:

```
cp /usr/share/applications/google-chrome.desktop ~/.local/share/applications
vi ~/.local/share/applications/google-chrome.desktop
```

Add the following to the end of every line that begins with `Exec` (space included):

```
 --password-store=basic
 ```

Uncheck the startup boxes to make Chrome the default browser and send diagnostics. Sign in to Google account.

Change the following in Settings:

- Autofill and passwords
  - Google Password Manager
    - Settings
      - Offer to save password: Off
      - Sign in automatically: Off
  - Payment methods
    - Save and fill payment methods: Off
    - Allow sites to check if you have payment methods saved: Off
  - Addresses and more
    - Save and fill addresses: Off
- Privacy and security
  - Security
    - Safe Browsing
      - Enhanced protection
    - Secure connections
      - Always use secure connections: On
- Performance
  - Memory
    - Memory Saver: On
- Appearance
  - Theme: Classic
    - Appearance: Second color option (should have the white top bar)
  - Use system title bar and borders: On
- Search engine
  - Search engine: DuckDuckGo

## Extensions

Open the [Chrome Web Store](https://chromewebstore.google.com/) and install the following extensions and change each ones respective shortcuts in `chrome://extensions/shortcuts`:

- Bitwarden - Free Password Manager by Bitwarden Inc.
  - Activate the extension: Alt+L
- Don't Close Window With Last Tab by Marcel Dopita
- OneTab by OneTab Team

### Bitwarden

Click the Bitwarden extension button, and log in (making sure to check the remember login information), and go to Settings. Change the following setting:

- Other
	- Options
		- Autofill
          - Autofill suggestions
            - Show autofill suggestions as form fields: Off
            - Show identities suggestions as Autofill suggestions on Vault view
            - Click items to autofill on Vault view
		  - Additional options
			- Clear clipboard: 2 minutes
        - Notifications
          - Save to vault options
            - Ask to save and use passkeys: Off
            - Ask to add login: Off
            - Ask to update existing login: Off
        - Appearance
          - Compact mode: On
          - Show quick copy options on Vault

### OneTab

Click the OneTab extension icon, and unpin the newly created tab. Change the following settings:

- Startup: Do not open OneTab automatically
