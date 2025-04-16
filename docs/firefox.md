# Firefox

Open Application Menu, and open Settings. Change the following settings:

- Sync
	- Sign in
	- Device Name: Same as device name
- Home
    - New Windows and Tabs
      - Homepage and new windows: Firefox Home (Default)
      - New tabs: Firefox Home (Default)
	- Firefox Home Content
		- Web Search: On
		- Shortcuts: Off
        - Weather: Off
		- Recommended stories: Off
		- Recent activity: Off
- Search
	- Default Search Engine: DuckDuckGo
	- Search Suggestions
      - Show search suggestions in address bar results: On
      - Show search suggestions ahead of browsing history in address bar results: Off
    - Address Bar - Firefox Suggest
		- Browsing history: Off
		- Bookmarks: Off
		- Open tabs: Off
		- Shortcuts: Off
		- Search engines: Off
      - Suggestions from Firefox: Off
      - Suggestions from sponsers: Off
	- Search Shortcuts
		- Google: Off
		- Amazon.com: Off
		- Bing: Off
		- DuckDuckGo: Off
		- eBay: Off
		- Wikipedia (en): Off
		- Bookmarks: Off
		- Tabs: Off
		- History: Off
- Privacy & Security
	- Enhanced Tracking Protection: Strict
        - Tell websites not to sell or share my data: On
		- Send websites a "Do Not Track" signal that you don't want to be tracked: On
	- Passwords
		- Ask to passwords: Off
	- Forms and Autofill
		- Save and fill addresses: Off
		- Save and fill payment methods: Off
	- Firefox Data Collection and Use
		- Allow Firefox to send technical and interation data to Mozilla: Off
		- Allow Firefox to install and run studies: Off

## GNOME Theme

Run the following to install a GNOME theme for Firefox (source: https://github.com/rafaelmardojai/firefox-gnome-theme):

```
git clone https://github.com/rafaelmardojai/firefox-gnome-theme && cd firefox-gnome-theme
./scripts/auto-install.sh
```

Enter `about:config` into the URL bar, and agree to enter. Click the + button for the following setting:

```
gnomeTheme.hideSingleTab
```

## Customize Toolbar

Right click empty space on the toolbar (same bar as the search bar), and go to Customize Toolbar. Complete the following actions:

- Insert one additional Flexible Space on both sides of the search bar
- Remove the Firefox account button
- Remove the New Tab button next to the open tabs
- Remove the Homepage button
- Move the download button to be after the refresh button
- Put "Save to Pocket" and "Show tabs from other devices" before the extension button

Right click an empty space on the Bookmarks toolbar. Change the following setting:

- Bookmarks Toolbar: Never show

## Extensions

Open Settings, and click the Extensions & Themes button at the bottom. Under the Extensions tab, click "Find more add-ons." Search and install the following extensions and change each ones respective shortcuts in `about:addons`:

- Bitwarden - Free Password Manager by Bitwarden Inc.
  - Open vault popup shortcut: Alt+L
- ChatGPT Bulk Delete by User_425
- Cookie AutoDelete by CAD Team
- CSS Override by swcolegrove
- Enter Key For AI by SuperJohn
  - Rate us and Provide Feedback shortcut: None
- OneTab by OneTab Team
- Progressive Web Apps by Filip S
- Return YouTube Dislike by Dmitry Selivanov
- SingleFile by gildas to Firefox
- SponsorBlock - Skip Sponsorships on YouTube by Ajay Ramachandran
- Todoist for Firefox by Todoist
  - Add to Todoist shortcut: Alt+A
- TWP - Translate Web Pages by Filipe Dev
- uBlock Origin by Raymond Hill
	- When prompted, allow to run in private windows
- UltraWideo by dvlden

### Bitwarden

Click the Bitwarden extension button, and log in (making sure to check the remember login information), and go to Settings. Change the following setting:

- Other
	- Options
		- Autofill
          - Autofill suggestions
            - Show autofill suggestions as form fields: Off
            - Show identities suggestions as Autofill suggestions on Vault view: Off
            - Click items to autofill on Vault view: On
		  - Additional options
			- Clear clipboard: 2 minutes
        - Notifications
          - Save to vault options
            - Ask to save and use passkeys: Off
            - Ask to add login: Off
            - Ask to update existing login: Off
        - Appearance
          - Compact mode: On
          - Show quick copy options on Vault: On

### CSS Override

Add the following to these specific websites CSS using this extension:

ChatGPT:

```
/* remove notice below the texting box */
@media (min-width: 768px) {
  .md\:px-\[60px\] {
    padding-left: 60px;
    padding-right: 60px;
    opacity: 0;
    padding-top: 0px;
    padding-bottom: 0px;
  }
}

/* hide 'add team workspace' button */
div.flex.flex-col.py-2.empty\:hidden {
    display: none;
}

/* hide 'help'  button */
button.flex.h-6.w-6.items-center.justify-center.rounded-full {
    opacity: 0;
}

/* hide 'close sidebar' and 'new chat' buttons */
button.h-10.rounded-lg.px-2.text-token-text-secondary {
    display: none;
}
/* add more padding after hiding 'close sidebar' and 'new chat' buttons */
@media (min-width: 768px) {
  .md\:h-header-height {
    height: 0.4rem;
  }
}

/* hide horizontal line from recent GPTs list */
.h-px {
    height: 0;
}
/* fix spacing after hiding horizontal line from recent GPTs list */
.my-2 {
  margin-bottom: 0rem;
  margin-top: 0rem;
}

/* make recent GPTs list more compact */
.mt-5 {
  margin-top: 0rem;
}

/* change label color in recent GPTs list */
.text-xs {
  color: #5881d7 !important;
}

/* add border to right side of recent GPTs container */
/* and change background color of it too */
nav[aria-label="Chat history"] {
  background-color: #fafafa;
  padding-left: .75rem;
  padding-right: .75rem;
  border-width: 1px;
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
  border-top-width: 1px;
  border-bottom-width: 1px;
  border-left-width: 1px;
  border-top: 0;
    border-top-color: currentcolor;
  border-top-color: currentcolor;
  border-bottom: 0;
    border-bottom-color: currentcolor;
  border-bottom-color: currentcolor;
  border-left: 0;
    border-left-color: currentcolor;
  border-left-color: currentcolor;
  border-color: #e0e0e0;
}

/* add border to texting box and change bg color */
.bg-\[\#f4f4f4\] {
  background-color: #fafafa;
  border-width: 1px;
  border-color: #e0e0e0;
}
```

### Enhancer for YouTube

Enhancer for YouTube by Maxime RF can be installed by downloading the XPI file to isntall manually. As of now (Feb. 23, 2024), it is not available on the Firefox Add-Ons page. Run the following in terminal, and add manually:

```
cd ~/Downloads
wget https://web.archive.org/web/20231022152055mp_/https://addons.mozilla.org/firefox/downloads/file/4157491/enhancer_for_youtube-2.0.121.xpi
```

Click the Enhancer for YouTube extension button, and change the following settings:

- Theme
  - Dark theme: On (if wanted); YouTube-DeepDark (custom)
    - YouTube DeepDark (custom): ff0000; #242424; #292929; #454545
- Video player
	- Controls
      - Disable all controls
	- Playback quality
		- Automatically select a playback quality: On
			- Select a different playback quality when entering the full screen mode: On
				- Videos (full screen): Use monitor resolution
				- Playlists (full screen): Use monitor resolution
				- Pop-up player and embedded videos (full screen): Use monitor resolution
            - Switch back to the previous playback quality when exiting the full screen mode: On
	- Autoplay
		- Disable autoplay: On
- Appearance
  - Use the available space based on the viewport dimensions to expand the video player: On
  - Hide chat: On
  - Hide Shorts: On (Change `layout.css.has-selector.enabled` to `true` in about:config)

### OneTab

Click the OneTab extension icon, and unpin the newly created tab. Change the following settings:

- Startup: Do not open OneTab automatically

## Progressive Web Apps

Follow the instructions presented by this extension when prompted. Make web apps for the following websites (make sure to select the Default profile for all of these):

- https://app.logos.com
- https://calendar.google.com/calendar/
- https://devdocs.io
- https://chatgpt.com
  - Icon URL: https://img.icons8.com/?size=100&id=FBO05Dys9QCg&format=png&color=000000
- https://music.youtube.com
- https://play.qobuz.com (if subscribed)
  - Name: Qobuz
  - Icon URL: https://external-content.duckduckgo.com/ip3/www.qobuz.com.ico
- https://mail.tutanota.com/mail/
- https://youtube.com
- TODO: Add URLs for these too `Crunchyroll, Disney+, Hulu, Max, Netflix, Paramount+, Prime Video, Tubi`
  - Prime video
    - Icon URL: https://img.icons8.com/?size=100&id=mJTj7Q9EPSVn&format=png&color=000000

Now, sign in to your Firefox account to sync extensions. Sign out of your account once everything is synced, restart the app, and uninstall everything but these extensions:

- Bitwarden - Free Password Manager 
- Cookie AutoDelete 
- CSS Override by swcolegrove
- Enter Key For AI by SuperJohn
- Return YouTube Dislike 
- SponsorBlock - Skip Sponsorships on YouTube 
- uBlock Origin 

Install the hide-scrollbars extension by qashto from the Firefox Add-Ons website.

Change Firefox's application settings to follow this guide, and then adjust these settings apart from the other settings:

- Privacy & Security
  - Browser Privacy
    - Enhanced Tracking Protection: Standard
  - Permissions
    - Location
      - Settings
        - Block new requests asking to access your location
    - Camera
      - Settings
        - Block new requests asking to access your location
    - Microphone
      - Settings
        - Block new requests asking to access your location
    - Notifications
      - Settings
        - Block new requests asking to access your location
    - Virtual Reality
      - Settings
        - Block new requests asking to access your location

For the following websites, change the following settings:

- https://devdocs.io
  - Website preferences
    - General
      - Automatically download documentation for offline use: On

Once all this is set up, open `about:support` and open the profile directory in a terminal. Create `chrome/userChrome.css` and paste the following into it to hide the titlebar ([source](https://superuser.com/a/1619663)):

```
/* hides the title bar */
#titlebar {
  visibility: collapse !important;
}

#TabsToolbar {
  visibility: collapse !important;
}
```

Now, open `about:config`, and set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`, as well as these VA-API settings listed later in this document:

```
media.ffmpeg.vaapi.enabled = true
media.ffvpx.enabled = false
media.rdd-vpx.enabled = false
extensions.screenshots.disabled = true
```

### Tutanota

Go to Settings, and change the following settings:

- Email
    - Default sender: Enter personal email
    - Default delivery: Not confidential
    - Email signature
        - Enter personal signature and save
- Appearance
	- User settings
		- Week start: Sunday
- Desktop
	- Run in background: No
	- Default download path: `~/Downloads`
	- Desktop integration: Activated

## Netflix 1080p

Follow the directions [here](https://github.com/vladikoff/netflix-1080p-firefox/issues/63), downloading the file, renaming the file extension from `.zip` to `.xpi`, and installing it manually from the Firefox extensions page.

## TWP - Translate Web Pages by Filipe Dev

Change the following settings in the extension's menu:

- Show the button to translate the selected text: Off

## VA-API

Go to `about:config`, and change the following settings:

```
media.ffmpeg.vaapi.enabled = true
media.ffvpx.enabled = false
media.rdd-vpx.enabled = false
```

# Other about:config changes

Also change the following from `about:config`:

```
browser.tabs.closeWindowWithLastTab = false
browser.tabs.insertAfterCurrent = true
screenshots.browser.component.enabled = false
```

## DuckDuckGo settings

Change the following settings for the DuckDuckGo search engine settings page:

- General
  - Instant Answers: Off
  - Infinite Scroll for Images, Videos, and Shopping: Off
  - Advertisements: Off
  - Units of Measure: US-based (pounds, feet, Fahrenheit)
  - Install DuckDuckGo: Off
  - Privacy Newsletters: Off
  - Show occasional reminders to sign up for the DuckDuckGo privacy newsletters: Off
  - Homepage Privacy Tips: Off
  - Help Improve DuckDuckGo: Off
- Appearance
  - Theme: Terminal (dark)
  - Font: Custom; SF Pro Text (after following `fonts.md`)
  - Center Alignment: On
  - Background Color: #242424 (dark)
  - Header Behavior: On & Scrolling
  - Header Color: #292929 or #ebebeb (light)
  - Title Font: Custom; SF Pro Text (after following `fonts.md`)
  - Title Color: #87f1f3 (dark) or #438de6 (light)
  - Visited Title Color: #888888 (dark) or #869bb3 (light)
  - Snippet Color: #222222 (light)
  - URL Color: #888888 (dark) or #898888 (light)
  - URL Format: Domains Only
  - URL Placement: Below Snippet
  - Hover, Module, and Dropdown Background Color: #f7f7f7 (light)
  - Site Icons: Off
  - 'Always private' Reminder: Off
- Privacy
  - Video Playback: Open on third-party site
