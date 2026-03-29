While installing custom firmware on a 3DS does indeed remove the software-based region lock, it does ''not'' account for locale issues. '''Locale''' is additional data that a game will often ask the 3DS for that includes the console's current language and software region. As an example:
* The 3DS is a Japanese 3DS set to the Japanese language.
* You attempt to launch an American cartridge.
* The 3DS tells the game that it is a Japanese region console and would like the game to run in Japanese.
* The game, being an English game, does not have Japanese on the cartridge and does not know what to do with this information.
* The game crashes.

In some cases, games may successfully launch with an incorrect locale, but:
* Games may display partially or entirely in the language of the console, rather than the language on the cartridge
* Out-of-region DLC may not work properly

To mitigate this issue, Luma3DS allows you to specify the game's locale to allow the game to work properly. You may also use this feature to launch a game in a specific language without changing the system language (for example, if you want your 3DS user interface in English, but to launch a specific game in French). This page covers the various ways that you can specify a game's locale.

== Before you start ==
You '''must''' enable the <code>Enable game patching</code> option for locale settings to take effect. To enable it:
* Power off your device
* Press and hold (Select), and while holding (Select), power on your device to enter the Luma3DS configuration menu
* Scroll down to <code>Enable game patching</code> and enable it
** If enabled, it will be marked with <code>(x)</code>

== Methods ==

<tabber>
|-|Luma Locale Switcher=

This method is generally the easiest, as it pulls from your title database and therefore does not require you to look up the title ID of each game.

# If you don't already have it, download Luma Locale Switcher from [here](_files/LumaLocaleRegionAutoSetter_v1-1_226.cia) (direct download) and install the CIA file with FBI
#* If you choose to get this from elsewhere (e.g. Universal-Updater), ensure that you get the build that is marked as "NIGHTLY"
# Launch Luma Locale Switcher (the Luma with translation icon)
# Select "Titles"
# Navigate to the game for which you want to change the locale
# Set the locale to what the game '''expects'''
#* For example, if it's an American game and you want it to run in English, you should set the region to <code>USA</code> and the language to <code>EN</code>
# Exit Luma Locale Switcher

{{success|text=The game's locale should now be correctly set.}}

|-|Luma Locale Region Auto Setter=

This application automatically creates locale files from a {{GitHub|DarkSynopsis/LumaLocaleRegionAutoSetter/blob/master/README.md|predetermined list}}. This list is not comprehensive and may not include every game that is known to have locale issues.

# If you don't already have it, download Luma Locale Region Auto Setter from [here](_files/LumaLocaleRegionAutoSetter_v1-1_226.cia) (direct download) and install the CIA file with FBI.
# Launch Luma Locale Region Auto Setter
# Follow the prompts on-screen

{{success|text=If your game is on the list, then its locale should now be correctly set.}}

|-|Manual Locale Setting=

You can also set the locale manually by creating a text file.

# Insert your SD card into your computer
# Navigate to <code>sd:/luma/titles/</code>
#* Create the <code>titles</code> folder if it does not already exist
# Create a folder with the title ID of the game
#* You can get the game's title ID from [http://3dsdb.com/ here] (cartridges), [here](_files/3dsdb.html) (digital games), or from the <code>FBI -> Titles</code> menu
#* For example, Taiko no Tatsujin: Dokodon! Mystery Adventure's title ID is <code>0004000000190E00</code>, so you'd create a folder named <code>0004000000190E00</code>
# Create a new text document and name it <code>locale</code>
#* With file extensions enabled, the name of the file should be <code>locale.txt</code>
# Type the desired locale (based on what the game '''expects''') into the text document
#* For example, if it's an American game and you want it to run in English,  you should set the region to <code>USA</code> and the language to <code>EN</code>, so you should type <code>USA EN</code>
# Save your changes
# Remove your SD card and insert it into your device

{{success|text=The game's locale should now be correctly set.}}

</tabber>

== Extra: Extended Locale Setting ==
Some games, most notably 3DS:Tomodachi Life, are known to not launch with basic locale settings because they look not only at region and language, but sub-region within that region (e.g. a country/territory and/or a state). You can still set the locale of such a game, but you will have to follow manual instructions using 