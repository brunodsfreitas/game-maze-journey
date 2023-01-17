/*-----------------------------------------------------------------------

Ethanon Engine (C) Copyright 2009-2011 André Santee
http://www.asantee.net/gamespace/ethanon/
Bruno Freitas - Game Programmer
Project : Maze Journey
>> brunin_rap@hotmail.com <<

-----------------------------------------------------------------------*/
/*         INDEX FUNCTIONS
/-------------------------------	
/		| Menu_Load()			
/		| Menu_Loop()
/		| NewGame()
/		| GameLoop()
/		| Credits_Load()
/		| EndGame_Load()
/		| EndGame_Loop()
/		| Error_Load()
/		| Error_Loop()
/		| GameOver_Load()
/		| GameOver_Loop()
/		| SelectCharacter_Load()
/		| SelectCharacter_Loop()
/		| Difficulty_Load()
/		| Difficulty_Loop()
/		| GameTime_Update()
/		| Level_Load()
/		| Random_Map()
/		| Change_Position_Cursor()
/		| Language_Selection_Loop()
/		| Highscores_Load()
/		| Highscores_Loop()
/		| SetHighscores()
/		| InsertPoints()
/		| Help_Load()
/		| Help_Loop()
/		| Create_Highscore()
/------------------------------
*/


//=================Menu_Load================================
void Menu_Load()
{
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoadSprite('sources\\menu.'+language);
	points = 0;
	level = 1;
	for (uint a = 0;a < 15; a++)
	levels_played[a] = 0;
	SetCameraPos(vector2(0,0));
	index = 0;
	AddEntity("cursor.ent", pos_cursor, cursor);
}//=================Menu_Load===============================

//=================Menu_Loop================================
void Menu_Loop()
{
	//######### positions = 0:start - 1:credits - 2:exit - 3:highscores ##########
	vector3 [] positions = {vector3(95,395,0),vector3(355,524,0),vector3(695,670,0),vector3(60,701,0)};
	pos_cursor = positions[index];
	cursor.SetPosition(pos_cursor);
	cursor.SetFrame(charaTimer.Set(0,3,50),0);
	DrawSpriteZ('sources\\menu.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	
	ETHInput @input = GetInputHandle();
	
	Change_Position_Cursor(0, 4);
	
	if (input.GetKeyState(K_SPACE) == KS_RELEASE || input.GetKeyState(K_RETURN) == KS_RELEASE)
	{
		PlaySample('sounds\\silence.ogg');
		if (index == 1)
			LoadScene("scenes\\credits.esc", "Credits_Load", "Credits_Loop");
		else if (index == 0)
			LoadScene("scenes\\credits.esc", "Difficulty_Load", "Difficulty_Loop");
		else if (index == 3)
			LoadScene("scenes\\credits.esc", "Highscores_Load", "Highscores_Loop");
		else 
			Exit();
	}
	
	if (input.GetKeyState(K_F1) == KS_RELEASE)
		LoadScene("scenes\\credits.esc", "Help_Load", "Help_Loop");
	
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		LoadScene("scenes\\credits.esc", "Language_Selection_Load", "Language_Selection_Loop");
	
}//=================Menu_Loop===============================

//=================NewGame=================================
void NewGame()
{
	LoadSprite('entities\\button_red_press.png');
	LoadSprite('entities\\normalmaps\\button_red_press_normal.png');
	LoadSprite('entities\\button_yellow_press.png');
	LoadSprite('entities\\normalmaps\\button_yellow_press_normal.png');
	LoadSoundEffect('sounds\\silence.ogg');
	LoadSoundEffect('sounds\\button.ogg');
	LoadSoundEffect('sounds\\gold.ogg');
	string music_now = Music_Load();
	LoadMusic(music_now);
	LoopSample(music_now, true);
	ETHEntity @player;

	vector2 NPos;
	gametime_s = 0;
	gametime_m = 3;
	
	esc_delay = GetTime();
	isPaused = false;
	
	if (map == 1)
	{
		NPos = vector2(1,41);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 2)
	{
		NPos = vector2(1,3);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 3)
	{	
		NPos = vector2(59,43);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 4)
	{
		NPos = vector2(29,41);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 5)
	{	
		NPos = vector2(31,21);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 6)
	{
		NPos = vector2(11,31);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 7)
	{
		NPos = vector2(49,11);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 8)
	{
		NPos = vector2(29,3);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 9)
	{
		NPos = vector2(1,21);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 10)
	{
		NPos = vector2(29,21);
		level_buttons = 100;
		block_entity = "none";
		block_entity_id = 0;
	}
	else if (map == 11)
	{
		NPos = vector2(15,31);
		level_buttons = 2;
		block_entity = "circle_1.ent";
		block_entity_id = 392;
	}
	else if (map == 12)
	{
		NPos = vector2(59,21);
		level_buttons = 4;
		block_entity = "rock_dark_1.ent";
		block_entity_id = 135;
	}
	else if (map == 13)
	{
		NPos = vector2(59,31);
		level_buttons = 5;	
		block_entity = "rock_2.ent";
		block_entity_id = 305;
	}
	else if (map == 14)
	{
		NPos = vector2(31,5);
		level_buttons = 8;
		block_entity = "rock_sand_1.ent";
		block_entity_id = 315;
	}
	else if (map == 15)
	{
		NPos = vector2(31,41);
		level_buttons = 12;
		block_entity = "rock_dark_1.ent";
		block_entity_id = 296;
	}
		
		
	AddEntity(player_select, vector3((NPos.x*16)+32,(NPos.y*16)+32,0), player);
	DrawFadingText(vector2((GetScreenSize().x/2)-80,(GetScreenSize().y/2)-25), kw_level+": "+level, 
	"Verdana64.fnt", ARGB(255,255,255,255), 3500);
	PlaySample('sounds\\silence.ogg');
	PlaySample(music_now);
}//=================NewGame================================

//=================GameLoop=================================
void GameLoop()
{
	ETHInput @input = GetInputHandle();
	if (isPaused == false)
	{
		uint WIDTH_TIME = 870;
		
		if (language == "bra")
			WIDTH_TIME = 850;
		
		if (input.GetKeyState(K_P) == KS_RELEASE)
			isPaused = true;
			
		if (input.KeyDown(K_ESC) && (GetTime() > esc_delay+4400))
		{
			level = 1;
			LoadScene("scenes\\credits.esc", "Menu_Load", "Menu_Loop");
		}
		
		if (input.GetKeyState(K_ALT) == KS_DOWN && input.GetKeyState(K_RETURN) == KS_HIT)
			SetWindowProperties(application_name, res_width, res_height, !Windowed(), true, PF32BIT);
			
		GameTime_Update(1000);
		DrawText(vector2(10,10), kw_points+": "+ points, "Verdana30.fnt", ARGB(100,255,255,255));
		
		if (gametime_s >= 0 && gametime_s <= 9)
			DrawText(vector2(WIDTH_TIME,10), kw_time+": "+gametime_m+":0"+gametime_s, "Verdana30.fnt", ARGB(100,255,255,255));
		else
			DrawText(vector2(WIDTH_TIME,10), kw_time+": "+gametime_m+":"+gametime_s, "Verdana30.fnt", ARGB(100,255,255,255));
		
		GetEntityArray(block_entity, block_passage);
		const uint nblock_entity = block_passage.size();
		uint t;
		vector3 posExplosion;
		
		if (level_buttons == 0)
		{
			for (t=0; t<nblock_entity; t++)
			{
				if ( block_passage[t].GetID() == block_entity_id)
				{
					posExplosion = vector3(block_passage[t].GetPositionXY().x,block_passage[t].GetPositionXY().y,0);
					DeleteEntity(block_passage[t]);
					AddEntity("big_explosion.ent", posExplosion, explosion);
					break;
				}
			}
			block_passage.clear();
			level_buttons == 100;
		}
		
		/*DEBUG=============		
		DrawText(vector2(50,50),""+"1: "+levels_played[0]+"\n2: "+levels_played[1]+"\n3: "+levels_played[2]+"\n4: "+levels_played[3]+"\n5: "+levels_played[4] , "Verdana30.fnt", ARGB(100,255,255,255));
		DrawText(vector2(200,50),""+"1: "+levels_played[5]+"\n2: "+levels_played[6]+"\n3: "+levels_played[7]+"\n4: "+levels_played[8]+"\n5: "+levels_played[9] , "Verdana30.fnt", ARGB(100,255,255,255));
		DrawText(vector2(350,50),""+"1: "+levels_played[10]+"\n2: "+levels_played[11]+"\n3: "+levels_played[12]+"\n4: "+levels_played[13]+"\n5: "+levels_played[14] , "Verdana30.fnt", ARGB(100,255,255,255));
		DrawText(vector2(100,50), "Lvel:"+level, "Verdana30.fnt", ARGB(100,255,255,255));
		DrawText(vector2(200,350), "DIF:"+difficulty, "Verdana30.fnt", ARGB(100,255,255,255));*/
	}
	else
	{
		DrawText(vector2((GetScreenSize().x/2)-80,(GetScreenSize().y/2)-25), kw_paused, "Verdana64.fnt", ARGB(200,255,255,255));
		if (input.GetKeyState(K_P) == KS_RELEASE)
			isPaused = false;
		if (input.GetKeyState(K_ESC) == KS_RELEASE)
		{
			level = 1;
			LoadScene("scenes\\credits.esc", "Menu_Load", "Menu_Loop");
		}
	}
}//================/GameLoop=================================

//================Credits_Load=================================
void Credits_Load()
{
	LoadMusic('sounds\\credits.ogg');
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoopSample('sounds\\credits.ogg', true);
	PlaySample('sounds\\credits.ogg');
	LoadSprite('sources\\credits.'+language);
}//================Credits_Load=================================

//=================Credits_Loop=================================
void Credits_Loop()
{
	DrawSpriteZ('sources\\credits.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	DrawText(vector2((GetScreenSize().x/2)-60,GetScreenSize().y-30), ""+kw_esctoback,
	"Verdana20_shadow.fnt", ARGB(220,236,150,0));
	ETHInput @input = GetInputHandle();
			
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		LoadScene("scenes\\credits.esc", "Menu_Load", "Menu_Loop");
}//=================/Credits_Loop===============================

//===============EndGame_Load=================================
void EndGame_Load()
{
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoadSoundEffect('sounds\\victory.ogg');
	PlaySample('sounds\\victory.ogg');
	LoadSprite('sources\\endgame.'+language);
	InsertHighscore();
}//===============/EndGame_Load================================

//================EndGame_Loop================================
void EndGame_Loop()
{
	DrawSpriteZ('sources\\endgame.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	DrawText(vector2((GetScreenSize().x/2)-100,GetScreenSize().y-160), kw_points+": "+points, "Verdana64.fnt", ARGB(250,253,174,23));
	DrawText(vector2((GetScreenSize().x/2)-60,GetScreenSize().y-30),""+kw_esctoback,
	"Verdana20_shadow.fnt", ARGB(220,236,150,0));
	
	ETHInput @input = GetInputHandle();
			
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		LoadScene("scenes\\credits.esc", "Highscores_Load", "Highscores_Loop");
}//===============/EndGame_Loop=================================

//=================Error_Load===================================
void Error_Load()
{
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoadSprite('sources\\pixelshader.'+language);
}//================/Error_Load===================================

//=================Error_Loop===================================
void Error_Loop()
{
	DrawSpriteZ('sources\\pixelshader.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	
	ETHInput @input = GetInputHandle();
	
	DrawText(vector2((GetScreenSize().x/2)-60,GetScreenSize().y-30), ""+kw_esctoexit,
	"Verdana20_shadow.fnt", ARGB(220,236,150,0));
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		Exit();
}//================/Error_Loop===================================

//================GameOver_Load=================================
void GameOver_Load()
{
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoadSoundEffect('sounds\\gameover.ogg');
	PlaySample('sounds\\gameover.ogg');
	LoadSprite('sources\\gameover.'+language);
	InsertHighscore();
}
//=================/GameOver_Load================================

//=================GameOver_Loop=================================
void GameOver_Loop()
{
	DrawSpriteZ('sources\\gameover.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	DrawText(vector2(330,650), kw_points+": "+points, "Verdana64.fnt", ARGB(250,253,174,23));
	DrawText(vector2((GetScreenSize().x/2)-60,GetScreenSize().y-30),""+kw_esctoback,
	"Verdana20_shadow.fnt", ARGB(220,236,150,0));
	
	ETHInput @input = GetInputHandle();
			
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
	{
		points = 0;
		level = 1;
		LoadScene("scenes\\credits.esc", "Highscores_Load", "Highscores_Loop");
	}
}//================/GameOver_Loop================================

//=================SelectCharacter_Load==========================
void SelectCharacter_Load()
{
	LoadSprite('sources\\faces\\p_dark.bsf');
	LoadSprite('sources\\faces\\p_light.bsf');
	LoadSprite('sources\\faces\\p_girl_1.bsf');
	LoadSprite('sources\\faces\\p_girl_2.bsf');
	LoadSprite('sources\\faces\\p_man_1.bsf');
	LoadSprite('sources\\faces\\p_man_2.bsf');
	LoadSprite('sources\\select_character.'+language);
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	index = 1;
}//=================/SelectCharacter_Load==========================

//=================SelectCharacter_Loop==========================
void SelectCharacter_Loop()
{
	//POSITIONS #
	const vector2 [] positions_ = { 
				vector2(400,200),
				vector2(50,600),
				vector2(250,600),
				vector2(450,600),
				vector2(650,600),
				vector2(850,600)	};
									
	const vector2 size_low = vector2(100,100);
	const vector2 size_high = vector2(250,250);
	DrawSpriteZ('sources\\select_character.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	DrawText(vector2((GetScreenSize().x/2)-130,GetScreenSize().y-50),""+kw_entertostart,
	"Verdana30_shadow.fnt", ARGB(220,236,150,0));
	if (index == 1)
	{
		DrawShapedSprite('sources\\faces\\p_dark.bsf', positions_[0], size_high, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_light.bsf', positions_[1], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_1.bsf', positions_[2], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_2.bsf', positions_[3], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_1.bsf', positions_[4], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_2.bsf', positions_[5], size_low, ARGB(255,255,255,255));
		player_select = "player_dark.ent";
	}
	else if (index == 2)
	{
		DrawShapedSprite('sources\\faces\\p_dark.bsf', positions_[1], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_light.bsf', positions_[2], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_1.bsf', positions_[3], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_2.bsf', positions_[4], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_1.bsf', positions_[5], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_2.bsf', positions_[0], size_high, ARGB(255,255,255,255));
		player_select = "player_man_2.ent";
	}
	else if (index == 3)
	{
		DrawShapedSprite('sources\\faces\\p_dark.bsf', positions_[2], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_light.bsf', positions_[3], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_1.bsf', positions_[4], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_2.bsf', positions_[5], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_1.bsf', positions_[0], size_high, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_2.bsf', positions_[1], size_low, ARGB(255,255,255,255));
		player_select = "player_man_1.ent";
	}
	else if (index == 4)
	{
		DrawShapedSprite('sources\\faces\\p_dark.bsf', positions_[3], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_light.bsf', positions_[4], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_1.bsf', positions_[5], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_2.bsf', positions_[0], size_high, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_1.bsf', positions_[1], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_2.bsf', positions_[2], size_low, ARGB(255,255,255,255));
		player_select = "player_girl_2.ent";
	}
	else if (index == 5)
	{
		DrawShapedSprite('sources\\faces\\p_dark.bsf', positions_[4], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_light.bsf', positions_[5], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_1.bsf', positions_[0], size_high, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_2.bsf', positions_[1], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_1.bsf', positions_[2], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_2.bsf', positions_[3], size_low, ARGB(255,255,255,255));
		player_select = "player_girl_1.ent";
	}
	else if (index == 6)
	{
		DrawShapedSprite('sources\\faces\\p_dark.bsf', positions_[5], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_light.bsf', positions_[0], size_high, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_1.bsf', positions_[1], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_girl_2.bsf', positions_[2], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_1.bsf', positions_[3], size_low, ARGB(255,255,255,255));
		DrawShapedSprite('sources\\faces\\p_man_2.bsf', positions_[4], size_low, ARGB(255,255,255,255));
		player_select = "player_light.ent";
	}
	ETHInput @input = GetInputHandle();
	
	Change_Position_Cursor(1, 7);
	
	if (input.GetKeyState(K_ENTER) == KS_RELEASE || input.GetKeyState(K_SPACE) == KS_RELEASE)
		Level_Load();
		
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
	{
		points = 0;
		level = 1;
		LoadScene("scenes\\credits.esc", "Difficulty_Load", "Difficulty_Loop");
	}
}//=================/SelectCharacter_Loop==========================

//=================Difficulty_Load===================================
void Difficulty_Load()
{
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoadSprite('sources\\difficulty.'+language);
	AddEntity("cursor.ent", pos_cursor, cursor);
	index = 0;
}
//=================/Difficulty_Load===================================

//=================Difficulty_Loop===================================
void Difficulty_Loop()
{
	//######### positions = 0:easy - 1:medium - 2:hard ##########
	vector3 [] positions = {vector3(375,200,0),vector3(305,370,0),vector3(378,573,0)};
	if (language == "bra")
	{
		positions[0] = vector3(360,205,0);
		positions[1] = vector3(140,370,0);
		positions[2] = vector3(335,573,0);
	}
	pos_cursor = positions[index];
	cursor.SetPosition(pos_cursor);
	cursor.SetFrame(charaTimer.Set(0,3,50),0);
	DrawSpriteZ('sources\\difficulty.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	
	ETHInput @input = GetInputHandle();
	
	Change_Position_Cursor(0, 3);
	
	if (input.GetKeyState(K_RETURN) == KS_RELEASE)
	{
		difficulty = index;
		LoadScene("scenes\\credits.esc", "SelectCharacter_Load", "SelectCharacter_Loop");
	}
			
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		LoadScene("scenes\\credits.esc", "Menu_Load", "Menu_Loop");
}//=================/Difficulty_Loop===================================

//==============================================GameTime_Update====
void GameTime_Update(uint time)
{
	if (gametime_control == true)
	{
		gametime_time = GetTime() + time;
		gametime_control = false;
	}
	else if (gametime_time < GetTime())
	{
		gametime_control = true;
		if (gametime_s != 0)
			gametime_s --;
		else		
		{
			gametime_s = 59;
			gametime_m --;
		}
		if (gametime_m == 0 && gametime_s == 0)
			LoadScene("scenes\\credits.esc", "GameOver_Load", "GameOver_Loop");
	}
}//==============================================/GameTime_Update====

//=================Level_Load======================================
void Level_Load()
{
		map = Random_Map();
		if (difficulty == 0)
				levels_played[level-1] = map;
		else if (difficulty == 1)
				levels_played[(5+level)-1] = map;
		else if (difficulty == 2)
				levels_played[(10+level)-1] = map;		
		LoadScene("scenes\\map_"+map+".esc", "NewGame", "GameLoop");
}//===============/Level_Load======================================

//=============================================Random_Map========
uint Random_Map()
{
	uint nMin;
	uint nMax;
	bool dontFind = false;
	
	switch (difficulty)
	{
		case 0:
			nMin = 1;
			nMax = 5;
			break;
		case 1:
			nMin = 6;
			nMax = 10;
			break;
		case 2:
			nMin = 11;
			nMax = 15;
			break;
	}
	
	while (dontFind == false) 
	{
		map = rand(nMin, nMax);
		bool Find = false;
		for (uint f = nMin;f <= nMax;f++)
		{
			if (levels_played[f-1] == map)
			   Find = true;
		}
		if (Find == false)
			dontFind = true;
	}	
	
	DrawText(vector2((GetScreenSize().x/2)-130,GetScreenSize().y-50),"+"+map,
	"Verdana30_shadow.fnt", ARGB(220,236,150,0));

	return map;
}//==============================================/Random_Map========

//=============================================Change_Position_Cursor=
void Change_Position_Cursor(int MiN, int MaX)
{
	ETHInput @input = GetInputHandle();
		
		if ((input.GetKeyState(K_RIGHT) == KS_RELEASE) || (input.GetKeyState(K_DOWN) == KS_RELEASE))
				{
					PlaySample('sounds\\gold.ogg');
					if (index >= MiN && index < MaX)
					{
						if (index+1 == MaX)
								index = MiN;
						else
								index++;
					}
				}
		if ((input.GetKeyState(K_LEFT) == KS_RELEASE) || (input.GetKeyState(K_UP) == KS_RELEASE))
				{		
					PlaySample('sounds\\gold.ogg');
					if (index >= MiN && index < MaX)
					{
							if (index-1 == MiN-1)
								index = (MaX-1);
							else
								index--;
					}
				}
}//===========================================/Change_Position_Cursor=

//============================Language_Selection_Load==================
void Language_Selection_Load()
{
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoadSprite('sources\\language.bra');
	AddEntity("cursor.ent", pos_cursor, cursor);
	index = 0;
}//===========================/Language_Selection_Load==================

//=========================================Language_Selection_Loop==================
void Language_Selection_Loop()
{
	//######### positions = 0:portugues - 1:english ##########
	vector3 [] positions = {vector3(225,240,0),vector3(295,485,0)};
	pos_cursor = positions[index];
	cursor.SetPosition(pos_cursor);
	cursor.SetFrame(charaTimer.Set(0,3,50),0);
	DrawSpriteZ('sources\\language.bra', 1, vector2(0,0), ARGB(255,255,255,255));
	
	ETHInput @input = GetInputHandle();
	
	Change_Position_Cursor(0, 2);
	
	if (input.GetKeyState(K_RETURN) == KS_RELEASE || input.GetKeyState(K_SPACE) == KS_RELEASE)
	{
		if (index == 0)
		{
				language = "bra";
				kw_esctoback = "ESC para voltar...";
				kw_level = "Nivel";
				kw_time = "Tempo";
				kw_points = "Pontos";
				kw_entertostart = "ENTER para selecionar...";
				kw_esctoexit = "ESC para sair...";
				difficulty_str[4] =  "Nenhum";
				difficulty_str[0] =  "Facil";
				difficulty_str[1] =  "Medio";
				difficulty_str[2] =  "Dificil";
				kw_paused = "Pausado!";
				kw_gold = "Ouro!";
		}
		else
		{
				language = "eng";
				kw_esctoback = "ESC to back...";
				kw_level = "Level";
				kw_time = "Time";
				kw_points = "Points";
				kw_entertostart = "ENTER to select...";
				kw_esctoexit = "ESC to exit...";
				difficulty_str[4] =  "None";
				difficulty_str[0] =  "Easy";
				difficulty_str[1] =  "Medium";
				difficulty_str[2] =  "Hard";
				kw_paused = "Paused!";
				kw_gold = "Gold!";
		}
		
		if (IsPixelShaderSupported() == false)
			LoadScene("scenes\\credits.esc", "Error_Load", "Error_Loop");
		else
			LoadScene("scenes\\credits.esc", "Menu_Load", "Menu_Loop");
	}
			
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		Exit();
}//=========================/Language_Selection_Loop==================

//=================Highscores_Load=================================
void Highscores_Load()
{		
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
	LoadSprite('sources\\highscores.'+language);
}//================/Highscores_Load=================================

//=================Highscores_Loop=================================
void Highscores_Loop()
{	
	//------> LOAD HIGHSCORES <-----------------------------------------
	const string Highscores_Loaded = GetStringFromFile("Highscores.txt");
	enmlFile Highscores;
	Highscores.parseString(Highscores_Loaded);
	string correctZeroHour;
	string correctZeroMinute;
	string [] hs_points = { Highscores.get("HighScores0", "points"),
							Highscores.get("HighScores1", "points"),
							Highscores.get("HighScores2", "points"),
							Highscores.get("HighScores3", "points"),
							Highscores.get("HighScores4", "points"),
							Highscores.get("HighScores5", "points"),
							Highscores.get("HighScores6", "points"),
							Highscores.get("HighScores7", "points"),
							Highscores.get("HighScores8", "points"),							
							Highscores.get("HighScores9", "points")};
	string [] hs_day = { 	Highscores.get("HighScores0", "day"),
							Highscores.get("HighScores1", "day"),
							Highscores.get("HighScores2", "day"),
							Highscores.get("HighScores3", "day"),
							Highscores.get("HighScores4", "day"),
							Highscores.get("HighScores5", "day"),
							Highscores.get("HighScores6", "day"),
							Highscores.get("HighScores7", "day"),
							Highscores.get("HighScores8", "day"),							
							Highscores.get("HighScores9", "day")};
	string [] hs_month = { 	Highscores.get("HighScores0", "month"),
							Highscores.get("HighScores1", "month"),
							Highscores.get("HighScores2", "month"),
							Highscores.get("HighScores3", "month"),
							Highscores.get("HighScores4", "month"),
							Highscores.get("HighScores5", "month"),
							Highscores.get("HighScores6", "month"),
							Highscores.get("HighScores7", "month"),
							Highscores.get("HighScores8", "month"),							
							Highscores.get("HighScores9", "month")};
	string [] hs_hour = { 	Highscores.get("HighScores0", "hour"),
							Highscores.get("HighScores1", "hour"),
							Highscores.get("HighScores2", "hour"),
							Highscores.get("HighScores3", "hour"),
							Highscores.get("HighScores4", "hour"),
							Highscores.get("HighScores5", "hour"),
							Highscores.get("HighScores6", "hour"),
							Highscores.get("HighScores7", "hour"),
							Highscores.get("HighScores8", "hour"),							
							Highscores.get("HighScores9", "hour")};
	string [] hs_minute = { Highscores.get("HighScores0", "minute"),
							Highscores.get("HighScores1", "minute"),
							Highscores.get("HighScores2", "minute"),
							Highscores.get("HighScores3", "minute"),
							Highscores.get("HighScores4", "minute"),
							Highscores.get("HighScores5", "minute"),
							Highscores.get("HighScores6", "minute"),
							Highscores.get("HighScores7", "minute"),
							Highscores.get("HighScores8", "minute"),							
							Highscores.get("HighScores9", "minute")};
	string [] hs_difficulty = { Highscores.get("HighScores0", "difficulty"),
								Highscores.get("HighScores1", "difficulty"),
								Highscores.get("HighScores2", "difficulty"),
								Highscores.get("HighScores3", "difficulty"),
								Highscores.get("HighScores4", "difficulty"),
								Highscores.get("HighScores5", "difficulty"),
								Highscores.get("HighScores6", "difficulty"),
								Highscores.get("HighScores7", "difficulty"),
								Highscores.get("HighScores8", "difficulty"),							
								Highscores.get("HighScores9", "difficulty")};
	vector2 [] pos_rank = {		vector2(110,180),
								vector2(110,220),
								vector2(110,260),
								vector2(110,300),
								vector2(110,340),
								vector2(110,380),
								vector2(110,420),
								vector2(110,460),
								vector2(110,500),
								vector2(110,540)};
	vector2 [] pos_points = {	vector2(250,180),
								vector2(250,220),
								vector2(250,260),
								vector2(250,300),
								vector2(250,340),
								vector2(250,380),
								vector2(250,420),
								vector2(250,460),
								vector2(250,500),
								vector2(250,540)};
	vector2 [] pos_date = {		vector2(438,180),
								vector2(438,220),
								vector2(438,260),
								vector2(438,300),
								vector2(438,340),
								vector2(438,380),
								vector2(438,420),
								vector2(438,460),
								vector2(438,500),
								vector2(438,540)};
	vector2 [] pos_hours = {	vector2(590,180),
								vector2(590,220),
								vector2(590,260),
								vector2(590,300),
								vector2(590,340),
								vector2(590,380),
								vector2(590,420),
								vector2(590,460),
								vector2(590,500),
								vector2(590,540)};
	vector2 [] pos_difficulty = {	vector2(770,180),
									vector2(770,220),
									vector2(770,260),
									vector2(770,300),
									vector2(770,340),
									vector2(770,380),
									vector2(770,420),
									vector2(770,460),
									vector2(770,500),
									vector2(770,540)};
	//------> LOAD HIGHSCORES <-----------------------------------------
	
	DrawSpriteZ('sources\\highscores.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	
	for (uint ii = 0; ii < 10; ii++)
	{
		if (ParseInt(hs_hour[ii]) >= 0 && ParseInt(hs_hour[ii]) < 10)
			correctZeroHour = "0";
		else
			correctZeroHour = "";
		if (ParseInt(hs_minute[ii]) >= 0 && ParseInt(hs_minute[ii]) < 10)
			correctZeroMinute = "0";
		else
			correctZeroMinute = "";
			
		DrawText(pos_rank[ii], (ii+1)+"", "Verdana30_shadow.fnt", ARGB(250,253,174,23));
		DrawText(pos_points[ii], hs_points[ii]+"", "Verdana30_shadow.fnt", ARGB(250,253,174,23));
		if (language == "eng")
			DrawText(pos_date[ii], hs_month[ii]+"/"+hs_day[ii], "Verdana30_shadow.fnt", ARGB(250,253,174,23));
		else
			DrawText(pos_date[ii], hs_day[ii]+"/"+hs_month[ii], "Verdana30_shadow.fnt", ARGB(250,253,174,23));
		DrawText(pos_hours[ii], correctZeroHour+hs_hour[ii]+":"+correctZeroMinute+hs_minute[ii], "Verdana30_shadow.fnt", ARGB(250,253,174,23));
		DrawText(pos_difficulty[ii], difficulty_str[ParseUInt(hs_difficulty[ii])], "Verdana30_shadow.fnt", ARGB(250,253,174,23));
	}
	
	DrawText(vector2((GetScreenSize().x/2)-60,GetScreenSize().y-30),""+kw_esctoback,
	"Verdana20_shadow.fnt", ARGB(220,236,150,0));
	
	ETHInput @input = GetInputHandle();
			
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		LoadScene("scenes\\credits.esc", "Menu_Load", "Menu_Loop");
}//=============/Highscores_Loop=================================

//=========================InsertHighscore=======================
void InsertHighscore()
{
	string Highscores_Loaded;
	enmlFile Highscores;
	enmlEntity entity;
	string str;
	Highscores_Loaded = GetStringFromFile("Highscores.txt");
	Highscores.parseString(Highscores_Loaded);
	
	entity.clear();
	time_now.update();
	entity.add("points", ""+points);
	entity.add("day", ""+time_now.getDay());
	entity.add("month", ""+time_now.getMonth());
	entity.add("hour", ""+time_now.getHours());
	entity.add("minute", ""+time_now.getMinutes());
	entity.add("difficulty", difficulty+"");
	Highscores.addEntity("HighScores11", entity);
	str = Highscores.generateString();
	bool Order = false;
	SaveStringToFile("Highscores.txt", str);
	while (Order == false) 
	{	
		uint moves = 0;
		for (int count = 11; count > 0;count--)
		{				
			if (ParseUInt(Highscores.get("HighScores"+(count-1), "points")) <
				ParseUInt(Highscores.get("HighScores"+(count), "points")))
			{
				entity.clear();
				entity.add("points", Highscores.get("HighScores"+(count-1), "points"));
				entity.add("day", Highscores.get("HighScores"+(count-1), "day"));
				entity.add("month", Highscores.get("HighScores"+(count-1), "month"));
				entity.add("hour", Highscores.get("HighScores"+(count-1), "hour"));
				entity.add("minute", Highscores.get("HighScores"+(count-1), "minute"));
				entity.add("difficulty", Highscores.get("HighScores"+(count-1), "difficulty"));
				Highscores.addEntity("HighScores12", entity);
				str = Highscores.generateString();
				
				entity.clear();
				entity.add("points", Highscores.get("HighScores"+(count), "points"));
				entity.add("day", Highscores.get("HighScores"+(count), "day"));
				entity.add("month", Highscores.get("HighScores"+(count), "month"));
				entity.add("hour", Highscores.get("HighScores"+(count), "hour"));
				entity.add("minute", Highscores.get("HighScores"+(count), "minute"));
				entity.add("difficulty", Highscores.get("HighScores"+(count), "difficulty"));
				Highscores.addEntity("HighScores"+(count-1), entity);
				str = Highscores.generateString();
				
				entity.clear();
				entity.add("points", Highscores.get("HighScores12", "points"));
				entity.add("day", Highscores.get("HighScores12", "day"));
				entity.add("month", Highscores.get("HighScores12", "month"));
				entity.add("hour", Highscores.get("HighScores12", "hour"));
				entity.add("minute", Highscores.get("HighScores12", "minute"));
				entity.add("difficulty", Highscores.get("HighScores12", "difficulty"));
				Highscores.addEntity("HighScores"+(count), entity);
				str = Highscores.generateString();
				SaveStringToFile("Highscores.txt", str);
				
				moves++;
			}
		}
		if (moves == 0)
			Order = true;
	}
}//=====================/InsertHighscore=======================

//========================InsertPoints=======================
void InsertPoints (uint easy, uint medium, uint hard)
{
		if (difficulty == 0)
				points = points + easy;
		else if (difficulty == 1)
				points = points + medium;
		else if (difficulty == 2)
				points = points + hard;
}//=======================/InsertPoints=======================

//=================Help_Load================================
void Help_Load()
{
	LoadSprite('sources\\help.'+language);
	LoadSoundEffect('sounds\\gold.ogg');
	PlaySample('sounds\\gold.ogg');
}//================Help_Load=================================

//=================Help_Loop=================================
void Help_Loop()
{	
	DrawSpriteZ('sources\\help.'+language, 1, vector2(0,0), ARGB(255,255,255,255));
	
	DrawText(vector2((GetScreenSize().x/2)-60,GetScreenSize().y-30),""+kw_esctoback,
	"Verdana20_shadow.fnt", ARGB(220,236,150,0));
	
	ETHInput @input = GetInputHandle();
			
	if (input.GetKeyState(K_ESC) == KS_RELEASE)
		LoadScene("scenes\\credits.esc", "Menu_Load", "Menu_Loop");
}
//=================Help_Loop=================================

//============Music_Load======================================
string Music_Load()
{
		return 'sounds\\music'+rand(1, 6)+'.ogg';
		
}//=================/Level_Load================================

//=========================Create_Highscore=======================
void Create_Highscore()
{
	string Highscores_Loaded;
	enmlFile Highscores;
	enmlEntity entity;
	string str;
	
	Highscores.addEntity("HighScores11", entity);
	
	for (int count = 0; count <= 12;count++)
	{				
			entity.clear();
			entity.add("points", "0");
			entity.add("day", "0");
			entity.add("month", "0");
			entity.add("hour", "0");
			entity.add("minute", "0");
			entity.add("difficulty", "4");
			Highscores.addEntity("HighScores"+count, entity);
			str = Highscores.generateString();
	}
	SaveStringToFile("Highscores.txt", str);
}//=====================/Create_Highscore=======================