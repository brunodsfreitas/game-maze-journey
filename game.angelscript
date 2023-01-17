/*-----------------------------------------------------------------------
 
Ethanon Engine (C) Copyright 2009-2011 André Santee
http://www.asantee.net/gamespace/ethanon/
Bruno Freitas - Game Programmer
Project : Maze Journey
>> brunin_rap@hotmail.com <<

-----------------------------------------------------------------------*/
/*         INDEX FUNCTIONS
/-------------------------------	
/		| ETHCallbacks()
/		| Input_Player()
/		| Control_Player()
/		| ETHCallback_cursor()
/------------------------------
*/

//========================================================ETHCallbacks=====
void ETHCallback_player_light(ETHEntity @thisEntity)
{
	Input_Player(thisEntity);
}

void ETHCallback_player_dark(ETHEntity @thisEntity)
{
	Input_Player(thisEntity);
}

void ETHCallback_player_girl_1(ETHEntity @thisEntity)
{
	Input_Player(thisEntity);
}
void ETHCallback_player_girl_2(ETHEntity @thisEntity)
{
	Input_Player(thisEntity);
}
void ETHCallback_player_man_1(ETHEntity @thisEntity)
{
	Input_Player(thisEntity);
}
void ETHCallback_player_man_2(ETHEntity @thisEntity)
{
	Input_Player(thisEntity);
}
//=======================================================/ETHCallbacks=====

//========================================================Input_Player===========
void Input_Player(ETHEntity @thisEntity)
{
	if (isPaused == false)
	{
		//====VARS=====
		ETHEntity @object;
		vector3 v3Dir(0,0,10);
		const float speed = UnitsPerSecond(120.0f);
		const uint stride = 50;
		//====VARS=====
		
		Control_Player(v3Dir, stride, thisEntity); 
		v3Dir = normalize(v3Dir)*speed;
		thisEntity.AddToPosition(v3Dir);
		if (CollideDynamic(thisEntity, object))
		{
			if (object.CheckCustomData("action") != DT_NODATA)
			{
				if (object.GetString("action") == "nextLevel")
				{
					level++;
					InsertPoints(300,500,700);
					if (level > 5)
						LoadScene("scenes\\credits.esc", "EndGame_Load", "EndGame_Loop");
					else
						Level_Load();
				}
				else if (object.GetString("action") == "gold_1")
				{
					InsertPoints(100,150,200);
					DrawFadingText(vector2(thisEntity.GetPositionXY().x-16, thisEntity.GetPositionXY().y-32),kw_gold, 
					"Verdana14_shadow.fnt", ARGB(200,255,219,43), 2500);
					AddEntity("explosion_.ent", thisEntity.GetPosition(), explosion_golds);
					PlaySample('sounds\\gold.ogg');
					DeleteEntity(object);
				}
				else if (object.GetString("action") == "gold_2")
				{
					InsertPoints(200,250,300);
					DrawFadingText(vector2(thisEntity.GetPositionXY().x-16, thisEntity.GetPositionXY().y-32),kw_gold, 
					"Verdana14_shadow.fnt", ARGB(200,255,219,43), 2500);
					AddEntity("explosion_.ent", thisEntity.GetPosition(), explosion_golds);
					PlaySample('sounds\\gold.ogg');
					DeleteEntity(object);
				}
				else if (object.GetString("action") == "gold_3")
				{
					InsertPoints(300,350,400);
					DrawFadingText(vector2(thisEntity.GetPositionXY().x-16, thisEntity.GetPositionXY().y-32),kw_gold, 
					"Verdana14_shadow.fnt", ARGB(200,255,219,43), 2500);
					AddEntity("explosion_.ent", thisEntity.GetPosition(), explosion_golds);
					PlaySample('sounds\\gold.ogg');
					DeleteEntity(object);
				}
				else if (object.GetString("action") == "noPress")
				{
					if (object.GetEntityName() == "button_red.ent")
					{
						DrawFadingText(vector2(thisEntity.GetPositionXY().x-16, thisEntity.GetPositionXY().y-32),"Click!", 
						"Verdana14_shadow.fnt", ARGB(200,79,84,255), 2500);
						PlaySample('sounds\\button.ogg');
						object.SetLightColor(vector3(0,0,0));
						object.SetSprite("button_red_press.png");
						object.SetNormal("button_red_press_normal.png");
						object.SetString("action","Pressed");
						object.SetCollision(false);
						level_buttons = level_buttons-1;
					}
					else if (object.GetEntityName() == "button_yellow.ent")
					{
						DrawFadingText(vector2(thisEntity.GetPositionXY().x-16, thisEntity.GetPositionXY().y-32),"Click!", 
						"Verdana14_shadow.fnt", ARGB(200,79,84,255), 2500);
						PlaySample('sounds\\button.ogg');
						object.SetLightColor(vector3(0,0,0));
						object.SetSprite("button_yellow_press.png");
						object.SetNormal("button_yellow_press_normal.png");
						object.SetString("action","Pressed");
						object.SetCollision(false);
						level_buttons = level_buttons-1;
					}
				}
			}
			else 
			{
				thisEntity.AddToPosition(v3Dir*-1);
			}
		}
	}
}//======================================================/Input_Player===========

//=============================================================Control_Player====
void Control_Player(vector3&out v3Dir_, uint stride_, ETHEntity @thisEntity_)
{	
	ETHInput @input = GetInputHandle();
			
			if (input.KeyDown(K_LEFT) || input.KeyDown(K_A))
			{
				thisEntity_.SetFrame(charaTimer.Set(0,2,stride_),1);
				v3Dir_.x +=-8;
			}
			if (input.KeyDown(K_RIGHT) || input.KeyDown(K_D))
			{
				thisEntity_.SetFrame(charaTimer.Set(0,2,stride_),2);
				v3Dir_.x += 8;
			}
			if (input.KeyDown(K_UP) || input.KeyDown(K_W))
			{
				thisEntity_.SetFrame(charaTimer.Set(0,2,stride_),3);
				v3Dir_.y +=-8;
			}
			if (input.KeyDown(K_DOWN) || input.KeyDown(K_S))
			{
				thisEntity_.SetFrame(charaTimer.Set(0,2,stride_),0);	
				v3Dir_.y += 8;
			}		
}//===========================================================/Control_Player====

//=========================================================ETHCallback_cursor====
void ETHCallback_cursor(ETHEntity @thisEntity)
{
	ETHInput @input = GetInputHandle();
	
	if (input.KeyDown(K_ALT) && input.KeyDown(K_RETURN))
	{
		SetWindowProperties(application_name, res_width, res_height, !Windowed(), true, PF32BIT);
	}
}//=======================================================/ETHCallback_cursor====