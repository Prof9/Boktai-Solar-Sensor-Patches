Boktai Solar Sensor Patch Kit v2.2.0

INTRO:
  The patches in this archive are solar sensor patches. They allow you
  to play the Boktai or Bokura no Taiyou games without a solar sensor,
  so that they can be played on a flash card or emulator that doesn't
  support it. The retail cartridges have a solar sensor built in,
  which affects many things in the game. Sunlight is crucial to
  playing the games; without sunlight, you cannot recharge your energy
  or defeat half of the bosses. Some puzzles are also impossible to do
  without sunlight.

  There were solar sensor patches for all three games already, but
  some of them (the patch for the third game in particular) had some
  faults like inconvenient button activators, a continuous
  increase/decrease of sunlight or the faked sunlight not affecting
  all in-game elements that it should. So, having played all the
  Boktai games, I tinkered with those patches a bit to fix things I
  didn't like; later, I wrote my own patches from scratch which are
  what you'll find in this archive.

  NOTE: The patches for Boktai 3 (J) are compatible with the English
  translation patch.
______________________________________________________________________

PATCHES
  This archive includes various patches for all Boktai games that have
  been released as ROM dumps. They're divided into four categories:

  Clean:          Removes all solar sensor hacks or trainers made by
                  other people or groups, returning a patched ROM to
                  its original clean state. I recommend you use this
                  patch first.
  Patch:          Applies my solar sensor hack. Use this after the
                  "Clean" patch, if necessary.
  Source:         Contains source code for all my patches. Use ARMIPS
                  v0.7d to compile.

  Supported game versions are:

  Boktai 1:
  - Japanese
  - North American (Beta)
  - North American
  - European

  Boktai 2:
  - Japanese
  - Japanese (Revision 1)
  - North American
  - European

  Boktai 3:
  - Japanese
______________________________________________________________________

CHANGES:
  In addition to supporting more regions, my patches differ slightly
  from other patches available on the web. Mine generally fake the
  solar sensor value at a lower level, so they should have the best
  effect. Furthermore, they do not change the save format or Real Time
  Clock. You can find some of the other differences below:

  Boktai 1:
  - Uses R+A+D-pad button activator instead of L+D-pad.
  - Doesn't have the bug where setting the solar gauge to empty does
    not actually block out all sunlight that some other patches have.
  - Works with Rising Sun grenades, Sunny Clogs and Mr.
    Rainnot/Tonniar .Rm.

  Boktai 2:
  - Uses Select button activator instead of R+D-pad.
  - Updates solar gauge graphics when changing the sunlight level
    while the game is paused.
  - Changes the sunlight level one bar per button press instead of
    a continuous increase/decrease.
  - Works with Rising Sun/Black Sun magic, Sunny Clogs and Mr.
    Rainnot/Tonniar .Rm.

  Boktai 3:
  - Uses Select button activator instead of L+D-pad.
  - Affects all game elements - Skylights, motorcycle sequences, Solar
    Stations - instead of only a few.
  - Updates solar gauge graphics when changing the sunlight level
    while the game is paused.
  - Changes the sunlight level one bar per button press instead of
    a continuous increase/decrease.
  - Works with Rising Sun magic, Sol Trance, Sunny Clogs and Mr.
    Rainnot/Tonniar .Rm.
______________________________________________________________________

HOW TO USE:
  The button activators are as follows:

  Boktai 1:
  R + A +  Left  = Decrease sunlight
  R + A +  Right = Increase sunlight

  Boktai 2:
  Select + Left  = Decrease sunlight
  Select + Right = Increase sunlight

  Boktai 3:
  Select + Left  = Decrease sunlight
  Select + Right = Increase sunlight
______________________________________________________________________

HOW TO PATCH:
  Drag and drop the IPS file corresponding to your game version on the
  Lunar IPS executable (Windows users only). Then, select your ROM and
  wait while the program patches it. Afterwards, you can delete the
  IPS file.

  If you are not using Windows, use another IPS patching utility to
  apply the patch to the ROM.

  For VisualBoy Advance users:
  If you do not want to patch your ROM, you can rename the IPS file to
  match the name of your ROM. For example, if your ROM is named
  Boktai.gba, you would name the patch Boktai.ips. Then, enable auto
  patching by checking Options -> Emulator -> Auto-apply IPS/UPS/PPF.
______________________________________________________________________

CLEAN ROMS:
  These patches were made for and tested on clean ROMs. While the
  chances are slim, due to the nature of the patches (they have all
  have an extension routine in free space) it's possible they might
  overwrite, or be overwritten by other hacks or patches. The extra
  routines have been placed in an empty region at the start of the ROM
  in an effort to avoid this, but it's always possible. The Boktai 3
  patch has been tested with the English fan translation, though.

  Always make sure to use a verified source such as No-Intro to check
  whether you have a clean ROM. However, if you are not sure whether
  your ROM is clean or not, try using the Cleaner patches.
______________________________________________________________________

HISTORY:
  v1.0.0 - 11 August 2010:
  - Initial release. Contained revised patches for European Boktai 1
    and 2, and Japanese Boktai 3.

  v2.0.0 - 25 July 2012:
  - Wrote new patches from scratch for all known Boktai ROM dumps.

  v2.1.0 - 7 February 2015
  - Fixed solar sensor deterioration bug for Boktai 3.
  - Removed Clean+Patch patches, as they caused problems in some
    situations.

  v2.2.0 - 21 March 2015
  - Patches now work properly with effects that modify the solar gauge
    such as Rising Sun, Sol Trance, Sunny Clogs and Mr. Rainnot.
  - Changed the button combination for Boktai 1 to R + A.
______________________________________________________________________

CREDITS:
  - Prof. 9:     Wrote Boktai 1, 2 and 3 patches in this archive.
  - MidniteW:    Bug testing.
  - FuSoYa:      Developer of Lunar IPS v1.02.
______________________________________________________________________

CONTACT:
  For bug reports and feedback, you can contact me in the following
  ways:

  E-mail:     prof9@outlook.com
  Twitter:    @Prof9
  Forums:     Prof. 9 (https://gbatemp.net)
______________________________________________________________________

LICENSE:
  This project is licensed under the terms of the MIT license. See
  license.txt for more information.

  Boktai, Bokura no Taiyou and Lunar Knights are © Konami 2003 - 2015.
  All rights belong to their respective owners.