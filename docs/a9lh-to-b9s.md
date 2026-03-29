# A9LH to B9S

## Required Reading

This page is for existing arm9loaderhax users to update their consoles to boot9strap.

All future releases of Luma3DS will only be made in the `.firm` format, which will only be compatible with boot9strap and sighax. This means that to continue receiving the latest updates of Luma3DS, you should use this page to update your installation.

## What You Need



:::

::: info

Note that, only on New 3DS, `secret_sector.bin` is needed to revert the arm9loaderhax exploit, which is why it is not needed for the installation of boot9strap on a stock console. If you do not have a New 3DS, you do not need `secret_sector.bin`.

:::

* <font-awesome-icon icon="fa-solid fa-magnet"/> - **New 3DS Users Only:**  [secret_sector.bin](_files/secret_sector.bin) (direct download)
* The latest release of [Luma3DS](_files/Luma3DSv13.3.3.zip) (the Luma3DS `.zip` file)
* The v7.0.5 release of [Luma3DS](_files/Luma3DSv7.0.5.zip) (direct download)
* The latest release of [SafeB9SInstaller](_files/SafeB9SInstaller-20170605-122940.zip) (direct download)
* The latest release of [boot9strap](_files/boot9strap-1.4.zip) (direct download)

## Instructions

### Section I - Prep Work

::: info

For all steps in this section, if any of the files already exist, overwrite them with the new files.

:::

1. Power off your console
1. Insert your SD card into your computer
1. Copy everything from the latest Luma3DS `.zip` to the root of your SD card
    + The root of the SD card refers to the initial directory on your SD card where you can see the Nintendo 3DS folder, but are not inside of it
1. Copy `arm9loaderhax.bin` from the v7.0.5 Luma3DS `.zip` to the root of your SD card
1. Copy `SafeB9SInstaller.bin` from the SafeB9SInstaller `.zip` to the `/luma/payloads/` folder on your SD card
    + If the `luma` or `payloads` folder doesn't exist, create them
    + Delete any other existing `.bin` payloads (`GodMode9.bin`, `Decrypt9WIP.bin`, `Hourglass9.bin`, etc.) in the `/luma/payloads/` folder on your SD card as they will not be compatible with boot9strap compatible Luma3DS versions
1. Create a folder named `boot9strap` on the root of your SD card
1. Copy `boot9strap.firm` and `boot9strap.firm.sha` from the boot9strap `.zip` to the `/boot9strap/` folder on your SD card
1. **New 3DS Users Only:** Copy `secret_sector.bin` to the `/boot9strap/` folder on your SD card

    ::: info

    ![](/images/screenshots/a9lh-to-b9s-root-layout.png)
    
    :::

1. Reinsert your SD card into your console

### Section II - Installing boot9strap

1. Boot your console while holding (Start) to launch SafeB9SInstaller
    + If you see the luma configuration screen instead of SafeB9SInstaller, simply press (Start), then shut down your 3DS and try again
    + If this gives you an error, try either using a new SD card or formatting your current SD card (backup existing files first)
1. Wait for all safety checks to complete
    + If you get an "OTP Crypto Fail" error, download <font-awesome-icon icon="fa-solid fa-magnet"/> - [aeskeydb.bin](_files/aeskeydb.bin) (direct download), then put it in the `/boot9strap/` folder on your SD card and try again
1. When prompted, input the key combo given on the top screen to install boot9strap
    + If a step on the lower screen has red-colored text, and you are not prompted to input a key combo, [follow this troubleshooting guide](troubleshooting-a9lh-to-b9s)
<!--@include: ./_include/configure-luma3ds.md -->

___

::: tip

Continue to [Finalizing Setup](finalizing-setup)

:::
