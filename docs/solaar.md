# Solaar

Run the following to install Solaar to use the thumb wheel of the Logitech MX Master 3S:

```
sudo dnf install solaar -y
```

Change the following settings (unlock to change and the lock once changed):

- Sensitivity (DPI): 1000
- Thumb Wheel Diversion: On
- Key/Button Actions
  - Mouse Gesture Button: Gesture Button Navigation
- Key/Button Diversion
  - Mouse Gesture Button: Mouse Gestures

Next, open the Rule Editor and create the following under user-defined rules:

- Rule
  - Sub-rule
    - Active: `MX Master 3S (...)`
    - Test: `thumb_wheel_up`
    - Key press: `XF86_AudioRaiseVolume`
  - Sub-rule
    - Active: `MX Master 3S (...)`
    - Test: `thumb_wheel_down`
    - Key press: `XF86_AudioLowerVolume`
  - Sub-rule
    - Active: `MX Master 3S (...)`
    - Mouse Gesture: `Mouse Up`
    - Key press: `XF86_AudioPlay`
  - Sub-rule
    - Active: `MX Master 3S (...)`
    - Mouse Gesture: `Mouse Down`
    - Key press: `XF86_AudioMute`
  - Sub-rule
    - Active: `MX Master 3S (...)`
    - Mouse Gesture: `Mouse Left`
    - Key press: `XF86_AudioPrev`
  - Sub-rule
    - Active: `MX Master 3S (...)`
    - Mouse Gesture: `Mouse Right`
    - Key press: `XF86_AudioNext`

Save changes and exit.
