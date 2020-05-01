#if defined _tacticalrobot_included
  #endinput
#endif
#define _tacticalrobot_included

enum TargetType
{
	TT_None = 0,
	TT_LookAt,
	TT_Move,		// target or targetent should be visible to the bot
	TT_Follow,		// requires targetent passed
	TT_Use,			// requires targetent passed
	TT_Attack,		// requires targetent passed
	TT_Attack2,		// requires targetent passed
	TT_Reload,		// target and targetent are ignored
	TT_Svencoop_Revive	// requires targetent passed, need pass "weapon_medkit" to targetweapon
}

native bot_create(name[])
native bot_settarget(bot, Float:target[3] = {0.0, 0.0, 0.0}, TargetType:tt = TT_None, targetent = 0, targetweapon[32] = "")
native bool:bot_isfree(bot)
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ ansicpg936\\ deff0{\\ fonttbl{\\ f0\\ fnil\\ fcharset134 Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang2052\\ f0\\ fs16 \n\\ par }
*/
