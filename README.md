# HDD-OSD Icon Generator for PlayStation 2
## Introduction
This is the **HDD-OSD Icon Generator** for the **[HDD-OSD Icon Database](https://github.com/CosmicScale/HDD-OSD-Icon-Database)**. The **[PSBBN Definitive Patch](https://github.com/CosmicScale/PSBBN-Definitive-English-Patch)** automatically creates HDD-OSD icons for display in Browser 2.0. However, icons can only be automatically created if sufficient assets are available in the OPL Manager Art Database. This icon generator allows you to create your own HDD-OSD icons by manually supplying the required images.

**[Please contribute any icons that you create to the HDD-OSD Icon Database](#contributing-to-the-hdd-osd-icon-database).**

## Installing
Before installing the icon generator, you should first install the **[PSBBN Definitive Patch](https://github.com/CosmicScale/PSBBN-Definitive-English-Patch)** on your PC and complete the setup process.

To install the icon generator, download the latest `Source code (zip)` from the **[release page](https://github.com/CosmicScale/HDD-OSD-Icon-Generator/releases)** and extract the files, or clone this repository.

## Download the Necessary Images
A good source of images is the **[LaunchBox Games Database](https://gamesdb.launchbox-app.com/)** but they can also be found in many other places online.  

Game icons require three images of the game's case, front, back and spine. If you cannot find an image for the spine, one of the placeholder images from the `Spines` folder can be used:

| Front | Back | Spine |
|-------|------|-------|
|<img width="128" height="128" alt="SLPS_014 59_COV-small" src="https://github.com/user-attachments/assets/180306dc-e425-4928-8602-fb489af75216" />|<img width="128" height="113" alt="SLPS_014 59_COV2-small" src="https://github.com/user-attachments/assets/a79bc53a-2e60-467e-aadb-f5267bd7a59e" />|<img width="6" height="128" alt="SLPS_014 59_LAB-small" src="https://github.com/user-attachments/assets/e6bd9a37-de7a-448a-9817-469991617ad0" />|


PS1 VMC memory card icons require one image of the game's logo:
| Logo |
|------|
|<img width="128" height="36" alt="SLPS_014 59_LGO-small" src="https://github.com/user-attachments/assets/e7d6b712-13ca-4d17-a780-a58dfb9c837e" />|

**NOTE:** The game logo should preferably be a `PNG` file with a transparent background. It will be resized to 300x125 so you should make sure the source image has the correct aspect ratio.

Download the images and place them in the `HDD-OSD-Icon-Generator/image` folder. The image filename's should be in the typical OPL format, the resolution and file format does not matter. For example a game with the title ID `SLPS_014.59` should look something like this:
- Front image - `SLPS_014.59_COV.bmp`
- Back image - `SLPS_014.59_COV2.jpg`
- Spine image - `SLPS_014.59_LAB.png`
- Game logo image - `SLPS_014.59_LGO.png`

## Creating an Icon
Windows users should double click on `ps2iconmaker.bat`, while Linux users should run `ps2iconmaker.sh`.

You will be asked to enter the game's title ID, then you will be presented with the following menu:
```
Type of icon to generate:
1 - PS2 DVD NTSC case
2 - PS2 DVD PAL case
3 - PS1 CD USA case
4 - PS1 CD USA Greatest Hits case
5 - PS1 JPN case
6 - PS1 PAL case
7 - PS1 multi-disc case
8 - PS1 virtual memory card

Enter icon type (1-8) [default 1]:
```
Choose the appropriate icon type for your game by entering a number from the list.

You will find your newly created game icons in `HDD-OSD-Icon-Generator/icon/game` and PS1 VMC icons in `HDD-OSD-Icon-Generator/icon/vmc`.

## Using the Icons
Game icons should be placed in the `PSBBN-Definitive-English-Patch/icons/ico` folder, VMC icons should be placed in the `PSBBN-Definitive-English-Patch/icons/ico/vmc` folder. Windows users can find these folders by opening a file explorer window, selecting `Linux` in the sidebar and navigating to `PSBBN/home/<username>`. The game installer will then use your newly created icons.

## Contributing to the HDD-OSD Icon Database
You are encouraged to contribute all icons created to the **[HDD-OSD Icon Database](https://github.com/CosmicScale/HDD-OSD-Icon-Database)** so they can be used by the community.

1. When you have created some icons, compress both the `HDD-OSD-Icon-Generator/icon/game` and `HDD-OSD-Icon-Generator/icon/vmc` folders into a single `.ZIP` file.
2. Create a new issue on the **[HDD-OSD Icon Database GitHub page](https://github.com/CosmicScale/HDD-OSD-Icon-Database/issues/new)** and attach the `.ZIP` file by dragging and dropping it to the text box.

## Credits
- `ps2iconmaker.sh` written by [Sakitoshi](https://github.com/Sakitoshi) and [CosmicScale](https://github.com/CosmicScale)
- Game icons and templates created by [CosmicScale](https://github.com/CosmicScale)
- Special thanks to Yornn for creating the 3D model for the VMC icon.
