# GPU and graphics

Run the following to install necessary graphics packages ([source](https://www.reddit.com/r/Fedora/comments/ud4uv0/fedora_for_gaming/)):

```
sudo dnf install vulkan-loader vulkan-loader.i686 vulkan vulkan-tools intel-media-driver ffmpeg-free power-profiles-daemon -y
```

(Only for desktop. I use default drivers for battery devices) Run the following if you plan to use your NVIDIA GPU:

```
sudo dnf install xorg-x11-drv-nvidia akmod-nvidia libva-nvidia-driver kmod-nvidia nvidia-modprobe nvidia-persistenced xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-power xorg-x11-drv-nvidia-xorg-libs xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs -y
```

## Switch to Xorg

Run the following to open the GDM config file:

```
sudo vi /etc/gdm/custom.conf
```

Uncomment `WaylandEnable=false` and add the following to the `[daemon]` section:

```
DefaultSession=gnome-xorg.desktop
```

Source: https://docs.fedoraproject.org/en-US/quick-docs/configuring-xorg-as-default-gnome-session/

## GRUB changes

Run the following to open the GRUB config file:

```
sudo vi /etc/default/grub
```

Change the `GRUB_CMDLINE_LINUX_DEFAULT` line to be this:

```
GRUB_CMDLINE_LINUX="rhgb quiet nomodeset nvidia-drm.modeset=1"
```

Run the following to apply changes:

```
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

## Save and reboot

Find installed kernel versions with this command:

```
uname -r
```

Install the kernel development tools with this command, replacing the kernel version with those found with the previous command:

```
sudo dnf install kernel-devel-X.X.X-XXX.fcXX.x86_64
sudo dnf install kernel-headers-X.XX.X-XXX.fc41.x86_64
```


Run the following to save and reboot:

```
sudo akmods --force
sudo dracut --force
sudo reboot
