# This is my collection of configs and packages for my standart arch setup 

## CLI tools

1. eza 
2. fzf
3. bat 
4. fd 

## Terminal 

Fish with the following extensions:

1. fzf-fish [https://github.com/PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish)
2. fish-eza `fisher install plttn/fish-eza` 

Fish config is saved here [config.fish](fish/config.fish)

## Terminal Emulator 

wezterm with the following config:

[https://www.thbe.org/posts/2024/10/06/Beautiful_command_line-WezTerm.html](https://www.thbe.org/posts/2024/10/06/Beautiful_command_line-WezTerm.html)

you can find the config file under [wezterm folder](wezterm/wezterm.lua) 

## Desktop

- KDE plasma
- Ant-Dark Theme
- Reveral-blak-dark icons


## bootable snapshots 

[source](https://discovery.endeavouros.com/encrypted-installation/btrfs-with-timeshift-snapshots-on-the-grub-menu/2022/02/)

1. Install EndeavourOS using automatic partitioning and the BTRFS filesystem (with or without encryption).

2. Timeshift is a GUI tool from the Linux Mint developers to manage system backups using rsync or BTRFS. Install Timeshift:
`sudo pacman -Syu timeshift`

3. The cronie service is a service used by Timeshift to run services periodically, but is not enabled by default. Cronie was installed as a dependency of Timeshift and should be enabled:
`sudo systemctl enable --now cronie.service`

4. Launch Timeshift and set it up to use BTRFS. Optionally enable automated snapshots at the intervals provided and choose if you would like your home folder included in snapshots (home folders are often not backed up using snapshots). Then create the first snapshot by clicking the “Create“ button in the top left corner of the window.

5. timeshift-autosnap provides a script which creates a snapshot before each package/system update using a Pacman hook. The default number of snapshots kept is three. Older snapshots are then deleted to make room for newer ones.
If you want this functionality, timeshift-autosnap can be installed from the AUR for automated snapshots:
`yay -S timeshift-autosnap`
Otherwise, snapshots will only be taken manually (they will still show up in the boot loader though).

6. Now install the grub-btrfs package from the community repository:
`sudo pacman -S grub-btrfs`
To include Timeshift’s BTRFS snapshots in the boot options, grub-btrfs needs to be reconfigured as it is using /.snapshots as the default snapshot directory and Timeshift uses a different directory:
sudo systemctl edit --full grub-btrfsd
Add the –timeshift-auto option by changing the following line:
`ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots`
to
`ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto`

7. The final step is to rebuild the grub configuration file:
`sudo grub-mkconfig -o /boot/grub/grub.cfg`

and enable the service:
`sudo systemctl enable --now grub-btrfsd`

## tools 

Flatpack:
1. VSCode
2. Conda 
3. Podmann

## other

## Tricks

### Omnissa Horizon Cline 

Put the following two lines in `/etc/environment`

```
LANG=en_US.utf-8
LC_ALL=C
```
This will solve the "locale invalid" problem at server connection. 
