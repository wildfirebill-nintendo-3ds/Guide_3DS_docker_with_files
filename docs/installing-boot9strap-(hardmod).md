# Installing boot9strap (Hardmod)

::: details Technical Details (optional)

An excellent guide to getting a hardmod can be found [here](https://gbatemp.net/threads/414498/).

This is a currently working implementation of the "FIRM partitions known-plaintext" exploit detailed [here](https://www.3dbrew.org/wiki/3DS_System_Flaws).

Using a hardmod, we can dump the NAND image, install custom firmware to the NAND image, then re-install the hacked NAND image to the console.

:::

## Compatibility Notes


This will work on New 3DS, New 2DS, Old 3DS, and Old 2DS on *all* versions that you have a corresponding `.firm` for.

## What You Need

* Your NAND image extracted using your [hardmod](https://gbatemp.net/threads/414498/)
* The latest release of [boot9strap](_files/boot9strap-1.4.zip) (direct download)
* The latest version of [hardmod-b9s-installer](_files/hardmod-b9s-installer1.0.zip)
    * Windows users can use the compiled `.exe`, while Mac and Linux users will need to have [Python 3](https://www.python.org/downloads/) installed to run the `.py`
* The latest release of [Luma3DS](_files/Luma3DSv13.3.3.zip) (the Luma3DS `.zip` file)
* The `.firm` corresponding to your console and version:

| Version(s) | Kernel | Old 3DS or Old 2DS | New 3DS or New 2DS |
|-|-|:-:|:-:|
| 1.0.0 | 2.27-0 | [2.27-0_1.0_OLD.firm](_hardmod/2.27-0_1.0_OLD.firm) | - |
| 1.1.0 | 2.28-0 | [2.28-0_1.1_OLD.firm](_hardmod/2.28-0_1.1_OLD.firm) | - |
| 2.0.0 | 2.29-7 | [2.29-7_2.0_OLD.firm](_hardmod/2.29-7_2.0_OLD.firm) | - |
| 2.1.0 | 2.30-18 | [2.30-18_2.1_OLD.firm](_hardmod/2.30-18_2.1_OLD.firm) | - |
| 2.2.0 | 2.31-40 | [2.31-40_2.2_OLD.firm](_hardmod/2.31-40_2.2_OLD.firm) | - |
| 3.0.0 | 2.32-15 | [2.32-15_3.0_OLD.firm](_hardmod/2.32-15_3.0_OLD.firm) | - |
| 4.0.0 | 2.33-4 | [2.33-4_4.0_OLD.firm](_hardmod/2.33-4_4.0_OLD.firm) | - |
| 4.1.0 - 4.5.0 | 2.34-0 | [2.34-0_4.1_OLD.firm](_hardmod/2.34-0_4.1_OLD.firm) | - |
| 5.0.0 | 2.35-6 | [2.35-6_5.0_OLD.firm](_hardmod/2.35-6_5.0_OLD.firm) | - |
| 5.1.0 | 2.36-0 | [2.36-0_5.1_OLD.firm](_hardmod/2.36-0_5.1_OLD.firm) | - |
| 6.0.0 | 2.37-0 | [2.37-0_6.0_OLD.firm](_hardmod/2.37-0_6.0_OLD.firm) | - |
| 6.1.0 - 6.4.0 | 2.38-0 | [2.38-0_6.1_OLD.firm](_hardmod/2.38-0_6.1_OLD.firm) | - |
| 7.0.0 - 7.1.0 | 2.39-4 | [2.39-0_7.0_OLD.firm](_hardmod/2.39-0_7.0_OLD.firm) | - |
| 7.2.0 | 2.40-0 | [2.40-0_7.2_OLD.firm](_hardmod/2.40-0_7.2_OLD.firm) | - |
| 8.0.0 - 8.1.0 | 2.44-6 / 2.45-5 | [2.44-6_8.0_OLD.firm](_hardmod/2.44-6_8.0_OLD.firm) | [2.45-5_8.1_NEW.firm](_hardmod/2.45-5_8.1_NEW.firm) |
| 9.0.0 - 9.2.0 | 2.46-0 | [2.46-0_9.0_OLD.firm](_hardmod/2.46-0_9.0_OLD.firm) | [2.46-0_9.0_NEW.firm](_hardmod/2.46-0_9.0_NEW.firm) |
| 9.3.0 - 9.4.0 | 2.48-3 | [2.48-3_9.3_OLD.firm](_hardmod/2.48-3_9.3_OLD.firmm) | [2.48-3_9.3_NEW.firm](_hardmod/2.48-3_9.3_NEW.firm) |
| 9.5.0 | 2.49-0 | [2.49-0_9.5_OLD.firm](m_hardmod/2.49-0_9.5_OLD.firm) | [2.49-0_9.5_NEW.firm](_hardmod/2.49-0_9.5_NEW.firm) |
| 9.6.0 - 9.9.0 | 2.50-1 | [2.50-1_9.6_OLD.firm](_hardmod/2.50-1_9.6_OLD.firm) | [2.50-1_9.6_NEW.firm](_hardmod/2.50-1_9.6_NEW.firm) |
| 10.0.0 | 2.50-7 | [2.50-7_10.0_OLD.firm](_hardmod/2.50-7_10.0_OLD.firm) | [2.50-7_10.0_NEW.firm](_hardmod/2.50-7_10.0_NEW.firm) |
| 10.2.0 - 10.3.0 | 2.50-9 | [2.50-9_10.2_OLD.firm](_hardmod/2.50-9_10.2_OLD.firm) | [2.50-9_10.2_NEW.firm](_hardmod/2.50-9_10.2_NEW.firm) |
| 10.4.0 - 10.7.0 | 2.50-11 | [2.50-11_10.4_OLD.firm](_hardmod/2.50-11_10.4_OLD.firm) | [2.50-11_10.4_NEW.firm](_hardmod/2.50-11_10.4_NEW.firm) |
| 11.0.0 | 2.51-0 | [2.51-0_11.0_OLD.firm](_hardmod/2.51-0_11.0_OLD.firm) | [2.51-0_11.0_NEW.firm](_hardmod/2.51-0_11.0_NEW.firm) |
| 11.1.0 | 2.51-2 | [2.51-2_11.1_OLD.firm](_hardmod/2.51-2_11.1_OLD.firm) | [2.51-2_11.1_NEW.firm](_hardmod/2.51-2_11.1_NEW.firm) |
| 11.2.0 | 2.52-0 | [2.52-0_11.2_OLD.firm](_hardmod/2.52-0_11.2_OLD.firm) | [2.52-0_11.2_NEW.firm](_hardmod/2.52-0_11.2_NEW.firm) |
| 11.3.0 | 2.53-0 | [2.53-0_11.3_OLD.firm](_hardmod/2.32-15_3.0_OLD.firm) | [2.53-0_11.3_NEW.firm](_hardmod/2.32-15_3.0_OLD.firm) |
| 11.4.0 - 11.7.0 | 2.54-0 | [2.54-0_11.4_OLD.firm](_hardmod/2.54-0_11.4_OLD.firm) | [2.54-0_11.4_NEW.firm](_hardmod/2.54-0_11.4_NEW.firm) |
| 11.8.0 - 11.11.0 | 2.55-0 | [2.55-0_11.8_OLD.firm](_hardmod/2.55-0_11.8_OLD.firm) | [2.55-0_11.8_NEW.firm](_hardmod/2.55-0_11.8_NEW.firm) |
| 11.12.0 - 11.13.0 | 2.56-0 | [2.56-0_11.12_OLD.firm](_hardmod/2.56-0_11.12_OLD.firm) | [2.56-0_11.12_NEW.firm](_hardmod/2.56-0_11.12_NEW.firm) |
| 11.14.0 - 11.15.0 | 2.57-0 | [2.57-0_11.14_OLD.firm](_hardmod/2.57-0_11.14_OLD.firm) | [2.57-0_11.14_NEW.firm](_hardmod/2.57-0_11.14_NEW.firm) |
| 11.16.0 - 11.17.0 | 2.58-0 | [2.58-0_11.16_OLD.firm](_hardmod/2.58-0_11.16_OLD.firm) | [2.58-0_11.16_NEW.firm](_hardmod/2.58-0_11.16_NEW.firm) |

## Instructions

### Section I - Prep Work

In this section, you will download the necessary files for the hardmod and dump the NAND image in preparation to install custom firmware.

1. Power off your console
1. Insert your SD card into your computer
1. Copy everything from the Luma3DS `.zip` to the root of your SD card
1. Copy the hardmod-b9s-installer folder from the hardmod-b9s-installer `.zip` to your computer
1. Copy your downloaded `.firm` to the hardmod-b9s-installer folder on your computer
1. Rename your downloaded `.firm` in the hardmod-b9s-installer folder on your computer to `current.firm`
1. Copy `boot9strap.firm` and `boot9strap.firm.sha` from the boot9strap `.zip` to the hardmod-b9s-installer folder on your computer
1. Reinsert your SD card into your console
1. Use your hardmod to create a NAND backup
1. Move your NAND backup to the hardmod-b9s-installer folder on your computer and rename it to `NAND.bin`

### Section II - Installing boot9strap

In this section, you will install custom firmware to the dumped NAND image, and then install this NAND image back onto the console to install custom firmware on it.

1. Run hardmod-b9s-installer
    + Windows Users: Run `install-b9s.exe`
    + Mac and Linux Users: Run `install-b9s.py`
1. Flash your outputted `NAND-patched.bin` to your console with your hardmod
1. Power off your console
1. Disconnect your hardmod
1. Press and hold (Select), and while holding (Select), power on your console
<!--@include: ./_include/configure-luma3ds.md -->

<!--@include: ./_include/luma3ds-installed-note.md -->

___

::: tip

Continue to [Finalizing Setup](finalizing-setup)

:::
