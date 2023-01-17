/*-----------------------------------------------------------------------

Ethanon Engine (C) Copyright 2009-2011 André Santee
http://www.asantee.net/gamespace/ethanon/
Bruno Freitas - Game Programmer
Project : Maze Journey
>> brunin_rap@hotmail.com <<

Encontre a luz e se livre dos paradigmas desta grande jornada!
-----------------------------------------------------------------------*/
//==========INCLUDES================
#include "eth_util.angelscript"
#include "game.angelscript"
#include "contents.angelscript"
//==========INCLUDES================

//==========VARGLOBAL================
ETHEntity @cursor;
ETHEntityArray block_passage;
ETHEntity @explosion;
ETHEntity @explosion_golds;
vector3 pos_cursor;
bool isPaused;
bool gametime_control = false;
int index;
int index_character;
int index_difficulty = 1;
dateTime time_now;
string kw_esctoback, kw_level, kw_time, kw_points, kw_entertostart, language, player_select, kw_esctoexit, kw_paused, kw_gold;
frameTimer charaTimer;
uint esc_delay;
uint gametime_time;
uint gametime_s, gametime_m;
uint level = 1;
uint map;
uint points = 0;
int block_entity_id;
uint level_buttons;
const string application_name = "Maze Journey";
const uint res_width = 1024;
const uint res_height = 768;
uint [] levels_played = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
string [] difficulty_str = { "", "", "", "", ""};
string block_entity;
uint difficulty = 1; // Difficulty: 1 = Easy | Difficulty: 2 = Medium | Difficulty: 3 = Hard;
//==========/VARGLOBAL================


void main()
{
	enmlFile Highscores;
	string Highscores_Loaded = GetStringFromFile("Highscores.txt");
	Highscores.parseString(Highscores_Loaded);
	
	if  (Highscores.exists("HighScores1") == false)
		Create_Highscore();
	
	HideCursor(true);

	SetWindowProperties(application_name, res_width, res_height, false, true, PF32BIT);

	LoadScene("scenes\\credits.esc", "Language_Selection_Load", "Language_Selection_Loop");

}
