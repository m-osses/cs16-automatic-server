# cs16-automatic-server

sudo docker-compose up -d --build
 
##Fake player plugin
 
 Description:
Allows admins to create a bot which can be fully controlled, e.g. move it and handle its menus, etc.

Why?
I didn't see many examples of making a bot in these forums, so i decided to make one.
This plugin can also be used for testing purposes, I myself hate asking other people to join my server to test some little stuff, then when I find an error, they have to wait on the server for ages before I get it fixed
Mostly its just for fun though

Commands:
amx_botadd <name> - create a new bot
amx_botexec <cmd> - execute a command on your bot
amx_botmove <0-2> - make your bot move:
* 0: off
* 1: copy your movements
* 2: same as #1 + aim the same spot when shooting
* 3: look the opposite way and do the opposite moves
amx_botcmds <1/0> - when enabled, all owner commands are sent to his/her bot
amx_botdel - kick your bot from the server

Server cvars:
potti_hudcolor <r g b> - changes the color of the hud message
potti_hudpos <x y> - changes the position of the hud message

Note:
When executing commands, only engine cmds will work, so for example cvars cannot be changed.
Also, I recommend you bind a button to "messagemode amx_botexec", it will be more comfortable to use than opening console every time.


To Do:
- nothing really (don't feel like messing with buyzone)

Known bugs:
- (cs) when owner is dead, pressing duck will open the specmenu which is really annoying
- (cs) can't open buymenu via fullcontrol mode if not in buyzone (or dead)


Changelog:
1.00 - Initial release
1.10 - Added full control mode (changing weapons through slot-keys is also possible now)
- Shows money left on a bot when a buymenu is opened
1.20 - Modified so everyone (with access) can have their own bot
- Cstrike-module is no more needed to display money
- After dying, the owner will automatically move to spectating to his/her bot if botmove is on
- Messages printed to a bot (to center and chat) are shown to its owner too
- Fixed bot latency to show as "BOT"
- More efficient msec calculations
- Other little improvements
1.30 - Added support for The Specialists (press 6 to switch to kungfu when in fullcontrol mode)
- Added botmove 3 to make the bot do the opposite of the owner
- Added a hudtext to show player health, weapon, etc.
- Access level changed from "m" to "p" ^_^
- Removed mod specific definitions
1.40 - Changed owner input hooking style, making it possible for bots to walk and use impulses (flashlight, spray, ..)
- A little tweaking here and there

Credits:
Botman - the source of PODBots helped alot while doing this
Lord of Destruction - aim_at_origin() -function base took from set_client_aiming()
THE_STORM - more efficient msec calculations (from ePODbot)
strelomet - display bot latency as "BOT" (from YaPB)
Orangutanz - thanks for pointing out the few improvements
Karko - thanks for helping with adding support for TS