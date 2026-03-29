Luma3DS has various optional features that are configurable via its config menu. If this is your first time using Luma3DS or you have updated to a version of Luma3DS with a different config version, the menu will be shown automatically. Otherwise, you need to hold `Select` while turning the 3DS on with the power button to trigger the menu. Each option is explained in the config menu itself on the bottom screen when highlighted.

![The Luma3DS v10.x configuration menu on Old 3DS/2DS](https://i.imgur.com/g3b4okL.png)
#### The Luma3DS v10.x configuration menu on Old 3DS/2DS; not all features discussed appear in this screenshot.
___

## Config Menu Options

* **Default EmuNAND:** If you have more than one EmuNAND on your SD card, you can choose the one Luma3DS will default to by using the A button to cycle between EmuNANDs one through four.
* **Screen brightness:** Choose one of four different brightness levels for the config menu and chainloaded payloads. Note that chainloaded payloads can define their own brightness level, overriding this option; for example, modern versions of GodMode9 determine brightness via the volume slider state.
* **Splash:** If this option is enabled, Luma3DS will look for custom splash screen images at /luma/splash.bin, /luma/splashbottom.bin, /luma/splashpin.bin on the SD card. These are displayed on the top, bottom, and at the pin entry screen respectively. Top screen images should be 400x240 pixels and bottom screen images should be 320x240 pixels. Custom splash screens can be downloaded from [Anemone3DS](https://github.com/astronautlevel2/Anemone3DS/releases/latest) or created manually from images via [this website](https://xem.github.io/3DShomebrew/tools/image-to-bin.html). There are three different modes:
  * **Off:** Splash screens disabled.
  * **Before:** Display the splash screen before loading any payloads; useful for payloads with the ability to detect hotkeys.
  * **After:** Chainload the desired payload, display the splash screen, and then continue to the payload. 
* **Splash duration:** The duration of the splash screen can be configured with this option. 
 Has four options:
  * **1:** Display the splash screen for one second before continuing boot or chainloading a payload.
  * **3:** Display the splash screen for three seconds before continuing boot or chainloading a payload.
  * **5:** Display the splash screen for five seconds before continuing boot or chainloading a payload.
  * **7:** Display the splash screen for seven seconds before continuing boot or chainloading a payload.
* **PIN lock:** Require a PIN to be entered before continuing boot. A message can be displayed on the bottom screen at the PIN input screen by placing a text file named `pinmessage.txt` in `/luma` (800 characters maximum!).
 Has four options:
  * **Off:** No PIN enabled, continue boot normally.
  * **4:** Require a 4 digit PIN.
  * **6:** Require a 6 digit PIN.
  * **8:** Require a 8 digit PIN. 
  * **Note:** This is more effective as child-proofing than as a complete theft deterrent; a thief could bypass this as easily as deleting Luma3DS' configuration files, changing the `boot.firm` payload on the SD card (or, if using Luma3DS on CTRNAND, inserting an SD card with a `boot.firm` on its root, since boot9strap shows priority to the SD card. Even Luma3DS installed in FIRM0/1 isn't completely "safe"; it could be bypassed easily with ntrboot or similar methods. 
* **New 3DS CPU:** Force the higher clock rate and/or extra L2 cache even on games/applications that do not officially support it. This can have performance benefits but a few rare games have stability issues with it. There are four options:
  * **Off:** Clock/L2 not forced, stock system behavior.
  * **Clock:** The New 3DS CPU will run at 804MHz instead of 268MHz even in games that are not New 3DS-enhanced if this option is selected.
  * **L2:** The New 3DS' extra L2 cache will be enabled for games that do not normally support it.
  * **Clock+L2:** The previous two options, combined. 
  * **Note:** Clock/L2 are also toggleable once the 3DS is already booted, via [Rosalina](https://github.com/AuroraWright/Luma3DS/wiki/Rosalina).
* **Autoboot EmuNAND:** If this option is enabled and an EmuNAND is present on your SD card, the default EmuNAND you've selected will be booted by default instead of sysNAND. You can boot into sysNAND by holding the `L` button if this option is enabled; vice versa if it's disabled. To use a non-default EmuNAND, hold down a button on the D-Pad: `Up`, `Right`, `Down`, `Left` for EmuNANDs 1, 2, 3 and 4 respectively. 
* **Use EmuNAND FIRM if booting with R:** If this option is enabled, the EmuNAND's NATIVE_FIRM will be used if R is held, even if booting into sysNAND. 
   * If this option is off, holding R will boot EmuNAND with sysNAND's NATIVE_FIRM.
   * You can override the EmuNAND to take the NATIVE_FIRM from by holding down a button on the D-Pad; `Up`, `Right`, `Down`, `Left` for EmuNANDs 1, 2, 3 and 4 respectively. 
* **Enable loading external FIRMs and modules:** When enabled, this option will look for FIRMs and sysmodules (builtins only!) in `/luma/` and `/luma/sysmodules` to load from the SD card instead of the versions on NAND. Supported external FIRMs and sysmodules are:

   * `native.firm`: NATIVE_FIRM, the main firmware.
   * `twl.firm`: TWL_FIRM, used for DSiWare and DS games.
   * `agb.firm`: AGB_FIRM, used for Gameboy Advance Virtual Console games.
   * `safe.firm`: SAFE_FIRM, NATIVE_FIRM for the 3DS' Safe Mode.
   * `sysupdater.firm`:
   * `name.cxi`: Any builtin sysmodule can be loaded externally, i.e. `fs.cxi`, `pm.cxi`, `loader.cxi`, etc. External sysmodule loading is unavailable if loading a NATIVE/SAFE_FIRM older than 3.0.0.
   * **Note:** If your FIRMs are NUS-encrypted, you must also include the corresponding cetk file, `cetk`, `cetk_twl`, `cetk_agb`, `cetk_safe`, and `cetk_sysupdater` respectively.

* **Enable game patching:** This option enables various game patching functions: external .code and exheader loading, IPS patching, LayeredFS, and Locale Emulation. 
  * **External `code.bin` and `exheader.bin` loading:** This feature allows you to load patched code and exheader binaries for ROM hacks/modifications/etc. without needing to rebuild the modified game as a CIA.
    * To use this feature, create /luma/titles/TID on your SD card and place the modified `code.bin` in the TID folder. Don't know your Title ID (TID)? Search your game on [3dsdb](http://www.3dsdb.com/) to find it. For example, Pokémon X's title ID is `0004000000055D00`, so if I wanted to patch its code binary, I would place my modified `code.bin` in `/luma/titles/0004000000055D00`. 
    * **Note:** These files must be decompressed! Compressed `.code` files and similar will not function here. You can decompress `.code` into `code.bin` with GodMode9 and many other tools.
  * **IPS patching:** Rather than include the entire `code.bin`, Luma3DS supports the [IPS patch format](https://zerosoft.zophar.net/ips.php) for code binary patching, allowing for you to distribute only your patches to the code, rather than requiring your users to patch the `code.bin` themselves or (more illegally) distributing the entire `code.bin`
    * Using this feature is the same as above, place your `code.ips` file in `/luma/titles/TID`.
  * **LayeredFS:** This allows you to replace files inside the romfs of a game/application. 
    * To use this feature, create `/luma/titles/TID/romfs` and place the your modified files from the game's romfs into the `romfs` folder.
    * **Note:** DLC patching and HANS-style `romfs` binary files (instead of a folder) are not supported at this time.
  * **Locale Emulation:** While Luma3DS allows games from all regions to be played via region-free patches, some games will freeze or crash if outside their expected region/locale. To fix this, Luma3DS allows emulating your locale. 
    * To use this feature, create a `locale.txt` inside `/luma/titles/TID/` file. Edit this text file to include the region (`JPN`, `USA`, `EUR`, `AUS`, `CHN`, `KOR`, `TWN`) and language (`JP`, `EN`, `FR`, `DE`, `IT`, `ES`, `ZH`, `KO`, `NL`, `PT`, `RU`, `TW`) separated by space. For example, to play Pokémon Y in the Japanese language and region, I would place a `locale.txt` in `/luma/titles/0004000000055E00` containing the contents `JPN JP`
    * **Note:** This level of locale emulation is not sufficient for some games; to fix this, improved locale emulation was introduced in Luma3DS v8.0, allowing you to specify a country and state ID (2-digit hex integer), i.e. a European `locale.txt` played in French would have the contents `EUR FR FR 01`. This extended locale emulation is not necessary in most cases. 
   * **Note:** There are possibly more locales available than stated above; a list extracted from Pokemon is available below for testing: 
     ``` 
     *regions[]   = {"---", "JPN", "USA", "EUR", "AUS", "CHN", "KOR", "TWN"}, 
     *languages[] = {"--", "JP", "EN", "FR", "DE", "IT", "ES", "ZH", "KO", "NL", "PT", "RU", 
                    "TW"}, 
     *countries[] = {"--", "JP", "--", "--", "--", "--", "--", "--", "AI", "AG", "AR", "AW", 
                    "BS", "BB", "BZ", "BO", "BR", "VG", "CA", "KY", "CL", "CO", "CR", "DM", 
                    "DO", "EC", "SV", "GF", "GD", "GP", "GT", "GY", "HT", "HN", "JM", "MQ", 
                    "MX", "MS", "AN", "NI", "PA", "PY", "PE", "KN", "LC", "VC", "SR", "TT", 
                    "TC", "US", "UY", "VI", "VE", "--", "--", "--", "--", "--", "--", "--", 
                    "--", "--", "--", "--", "AL", "AU", "AT", "BE", "BA", "BW", "BG", "HR", 
                    "CY", "CZ", "DK", "EE", "FI", "FR", "DE", "GR", "HU", "IS", "IE", "IT", 
                    "LV", "LS", "LI", "LT", "LU", "MK", "MT", "ME", "MZ", "NA", "NL", "NZ", 
                    "NO", "PL", "PT", "RO", "RU", "RS", "SK", "SI", "ZA", "ES", "SZ", "SE", 
                    "CH", "TR", "GB", "ZM", "ZW", "AZ", "MR", "ML", "NE", "TD", "SD", "ER", 
                    "DJ", "SO", "AD", "GI", "GG", "IM", "JE", "MC", "TW", "--", "--", "--", 
                    "--", "--", "--", "--", "KR", "--", "--", "--", "--", "--", "--", "--", 
                    "HK", "MO", "--", "--", "--", "--", "--", "--", "ID", "SG", "TH", "PH", 
                    "MY", "--", "--", "--", "CN", "--", "--", "--", "--", "--", "--", "--", 
                    "AE", "IN", "EG", "OM", "QA", "KW", "SA", "SY", "BH", "JO", "--", "--", 
                    "--", "--", "--", "--", "SM", "VA"}; 
     ```
* **Show NAND or user string in System Settings:** Replaces `Ver.` in the System Settings version string with NAND type or a custom user-set string. 
  * The default strings shown are:
    * **Sys:** SysNAND booted with with its own FIRM,
    * **Emu:** first EmuNAND booted with its own FIRM,
    * **EmuX** (where X can be 2, 3 or 4): EmuNAND X booted with its own FIRM,
    * **SysE:** SysNAND booted with the first EmuNAND's FIRM,
    * **SyEX:** (where X can be 2, 3 or 4): SysNAND booted with EmuNAND X's FIRM,
    * **EmuS:** first EmuNAND booted with the SysNAND FIRM,
    * **EmXS** (where X can be 2, 3 or 4): EmuNAND X booted with the SysNAND FIRM.
  * You can set a custom string for each NAND type (**maximum 19 characters!**); to do so, place `customversion_NANDtype.txt` in /luma; the proper file names are:
    * `customversion_sys.txt`: SysNAND
    * `customversion_emu.txt`: EmuNAND 1 
    * `customversion_emu2.txt`: EmuNAND 2 
    * `customversion_emu3.txt`: EmuNAND 3
    * `customversion_emu4.txt`: EmuNAND 4
* **Show GBA boot screen in patched AGB_FIRM:** If this option is enabled, the [original GBA boot screen](https://www.youtube.com/watch?v=m52rMtRCm7c) will be played after launching a Gameboy Advance Virtual Console game.
* **Set developer UNITINFO:** Patches the value of `CFG_UNITINFO` sent to the ARM11 on boot to make 
applications believe they're running on a development unit, and switches CIA encryption to the developer keys. Allows you to run certain devkit-only software, but breaks the ability to use the eShop, amiibo, retail-encrypted CIAs (almost all games), etc. Has the opposite effect on devkits running Luma.
* **Disable ARM11 exception handlers:** Disables the exception handlers on the ARM11 that provide details about crashes/exceptions that have occurred on the system. The ARM9 exception handlers remain enabled even if this option is checked and cannot be disabled. It is **highly recommended** to **not** use this option, and if you do so you forfeit your right to submit issues to the [Issues page of the Luma3DS repository](https://github.com/AuroraWright/Luma3DS/issues) until you disable this option.

## FIRM Payload Chainloader
Luma3DS has a built-in chainloader, allowing you to launch third party FIRM payloads via holding a key or choosing from a selection menu at boot. 
* To use this feature, place a FIRM payload in `/luma/payloads/` as `button_NAME.firm`. Note that `button_` is optional; if you only wish to use the chainloader selection menu to boot chainload payloads, `button_` is unnecessary. 
  * Available buttons are:
    * `x_NAME.firm`
    * `y_NAME.firm`
    * `select_NAME.firm`
    * `r_NAME.firm`
    * `a_NAME.firm`
    * `b_NAME.firm`
    * `right_NAME.firm`
    * `left_NAME.firm`
    * `up_NAME.firm`
    * `down_NAME.firm`
  * **Note:** For `r_NAME.firm`, `a_NAME.firm`, and `select_NAME.firm` you need to press `L+R`, `L+A`, and `L+SELECT` on boot respectively instead of the desired key alone; this is because these keys are used for other things in Luma3DS. 
  * To access the payload selection menu instead of using hotkeys, hold `START` at boot. You can scroll through the list of payloads with the D-Pad and press `A` to launch your choice.
  
## Other features
* **`SecureInfo_C` loading:** Mostly useful for region changing, Luma will load `SecureInfo_C` from `ctrnand:/rw/sys` instead of `SecureInfo_B` or `SecureInfo_A`, if available. This is convenient for using your region-changed `SecureInfo_A/B` without renaming or overwriting the original files.




