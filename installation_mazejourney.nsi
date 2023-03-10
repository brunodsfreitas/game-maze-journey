; mazejourney-installer.nsi
;
; This script is based on example1.nsi, but it remember the directory, 
; has uninstall support and (optionally) installs start menu shortcuts.
;
; It will install example2.nsi into a directory that the user selects,

;--------------------------------
; The name of the installer
Name "Maze Journey"

; The file to write
OutFile "C:\Maze-Journey\mazejourney-installer.exe"
Icon "C:\Maze-Journey\install.ico"
UninstallIcon "C:\Maze-Journey\uninstall.ico"

SetCompressor /SOLID lzma
SetDatablockOptimize off

; The default installation directory
InstallDir $PROGRAMFILES\Maze-Journey

; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\Maze-Journey" "Install_Dir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin
AllowRootDirInstall true

;--------------------------------

; Pages

Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

;--------------------------------

; The stuff to install
Section "Maze Journey Data (required)"

  SectionIn RO
  

		SetOutPath $INSTDIR
		
				File "C:\Maze-Journey\app.enml"
				File "C:\Maze-Journey\audiere.dll"
				File "C:\Maze-Journey\cg.dll"
				File "C:\Maze-Journey\cgD3D9.dll"
				File "C:\Maze-Journey\contents.angelscript"
				File "C:\Maze-Journey\d3dx9_42.dll"
				File "C:\Maze-Journey\eth_util.angelscript"
				File "C:\Maze-Journey\game.angelscript"
				File "C:\Maze-Journey\game.bin"
				File "C:\Maze-Journey\game.bin.readme.txt"
				File "C:\Maze-Journey\install.ico"
				File "C:\Maze-Journey\main.angelscript"
				File "C:\Maze-Journey\mazejourney.ico"
				File "C:\Maze-Journey\Maze_Journey.exe"
				File "C:\Maze-Journey\uninstall.ico"
				
		SetOutPath "$INSTDIR\data"
				
				File "C:\Maze-Journey\data\defaultStaticAmbientVS.cg"
				File "C:\Maze-Journey\data\defaultVS.cg"
				File "C:\Maze-Journey\data\default_nm.png"
				File "C:\Maze-Journey\data\dynaShadowVS.cg"
				File "C:\Maze-Journey\data\hPixelLight.cg"
				File "C:\Maze-Journey\data\hVertexLightShader.cg"
				File "C:\Maze-Journey\data\pixelLightVS.cg"
				File "C:\Maze-Journey\data\shadow.dds"
				File "C:\Maze-Journey\data\Verdana14_shadow.fnt"
				File "C:\Maze-Journey\data\Verdana14_shadow_0.png"
				File "C:\Maze-Journey\data\Verdana20.fnt"
				File "C:\Maze-Journey\data\Verdana20_0.png"
				File "C:\Maze-Journey\data\Verdana20_shadow.fnt"
				File "C:\Maze-Journey\data\Verdana20_shadow.png"
				File "C:\Maze-Journey\data\Verdana24.fnt"
				File "C:\Maze-Journey\data\Verdana24_0.png"
				File "C:\Maze-Journey\data\Verdana24_shadow.fnt"
				File "C:\Maze-Journey\data\Verdana24_shadow.png"
				File "C:\Maze-Journey\data\Verdana30.fnt"
				File "C:\Maze-Journey\data\Verdana30_0.png"
				File "C:\Maze-Journey\data\Verdana30_shadow.fnt"
				File "C:\Maze-Journey\data\Verdana30_shadow.png"
				File "C:\Maze-Journey\data\Verdana64.fnt"
				File "C:\Maze-Journey\data\Verdana64_0.png"
				File "C:\Maze-Journey\data\Verdana64_1.png"
				File "C:\Maze-Journey\data\vPixelLight.cg"
				File "C:\Maze-Journey\data\vVertexLightShader.cg"
				
		SetOutPath "$INSTDIR\effects"

				File "C:\Maze-Journey\effects\big_explosion.par"
				File "C:\Maze-Journey\effects\bluegeiser.par"
				File "C:\Maze-Journey\effects\burning_oil.par"
				File "C:\Maze-Journey\effects\chrono_trigger_blue_fire.par"
				File "C:\Maze-Journey\effects\demolition.par"
				File "C:\Maze-Journey\effects\desert_sand.par"
				File "C:\Maze-Journey\effects\dragon_flame.par"
				File "C:\Maze-Journey\effects\explosion.par"
				File "C:\Maze-Journey\effects\explosion_.par"
				File "C:\Maze-Journey\effects\explosion_particles.par"
				File "C:\Maze-Journey\effects\fireball.par"
				File "C:\Maze-Journey\effects\fire_ball.par"
				File "C:\Maze-Journey\effects\fire_smoke.par"
				File "C:\Maze-Journey\effects\lava_falls.par"
				File "C:\Maze-Journey\effects\meteor.par"
				File "C:\Maze-Journey\effects\player_.par"
				File "C:\Maze-Journey\effects\purple_haze.par"
				File "C:\Maze-Journey\effects\p_light.par"
				File "C:\Maze-Journey\effects\rain.par"
				File "C:\Maze-Journey\effects\small_explosion.par"
				File "C:\Maze-Journey\effects\smoke2.par"
				File "C:\Maze-Journey\effects\snow.par"
				File "C:\Maze-Journey\effects\snow_storm.par"
				File "C:\Maze-Journey\effects\tornado.par"
				File "C:\Maze-Journey\effects\tornado2.par"
				File "C:\Maze-Journey\effects\vapor.par"
				File "C:\Maze-Journey\effects\waterfall.par"
				File "C:\Maze-Journey\effects\wind_.par"
				File "C:\Maze-Journey\effects\zelda fire.par"

		SetOutPath "$INSTDIR\entities"				
				
				File "C:\Maze-Journey\entities\big_explosion.ent"
				File "C:\Maze-Journey\entities\blue_fire.ent"
				File "C:\Maze-Journey\entities\blue_fire_low_range.ent"
				File "C:\Maze-Journey\entities\blue_light.ent"
				File "C:\Maze-Journey\entities\button_red.ent"
				File "C:\Maze-Journey\entities\button_red.png"
				File "C:\Maze-Journey\entities\button_red_press.png"
				File "C:\Maze-Journey\entities\button_yellow.ent"
				File "C:\Maze-Journey\entities\button_yellow.png"
				File "C:\Maze-Journey\entities\button_yellow_press.png"
				File "C:\Maze-Journey\entities\circle_1.ent"
				File "C:\Maze-Journey\entities\circle_1.png"
				File "C:\Maze-Journey\entities\circle_2.ent"
				File "C:\Maze-Journey\entities\circle_2.png"
				File "C:\Maze-Journey\entities\circle_3.ent"
				File "C:\Maze-Journey\entities\circle_3.png"
				File "C:\Maze-Journey\entities\crystal_blue_1.ent"
				File "C:\Maze-Journey\entities\crystal_blue_1.png"
				File "C:\Maze-Journey\entities\crystal_blue_2.ent"
				File "C:\Maze-Journey\entities\crystal_blue_2.png"
				File "C:\Maze-Journey\entities\crystal_blue_3.ent"
				File "C:\Maze-Journey\entities\crystal_blue_3.png"
				File "C:\Maze-Journey\entities\crystal_purple_1.ent"
				File "C:\Maze-Journey\entities\crystal_purple_1.png"
				File "C:\Maze-Journey\entities\crystal_purple_2.ent"
				File "C:\Maze-Journey\entities\crystal_purple_2.png"
				File "C:\Maze-Journey\entities\crystal_purple_3.ent"
				File "C:\Maze-Journey\entities\crystal_purple_3.png"
				File "C:\Maze-Journey\entities\cursor.ent"
				File "C:\Maze-Journey\entities\cursor.png"
				File "C:\Maze-Journey\entities\c_dark.png"
				File "C:\Maze-Journey\entities\c_girl_1.png"
				File "C:\Maze-Journey\entities\c_girl_2.png"
				File "C:\Maze-Journey\entities\c_light.png"
				File "C:\Maze-Journey\entities\c_man_1.png"
				File "C:\Maze-Journey\entities\c_man_2.png"
				File "C:\Maze-Journey\entities\explosion_.ent"
				File "C:\Maze-Journey\entities\fireball.ent"
				File "C:\Maze-Journey\entities\fire_.ent"
				File "C:\Maze-Journey\entities\gold_1.ent"
				File "C:\Maze-Journey\entities\gold_1.png"
				File "C:\Maze-Journey\entities\gold_2.ent"
				File "C:\Maze-Journey\entities\gold_2.png"
				File "C:\Maze-Journey\entities\gold_3.ent"
				File "C:\Maze-Journey\entities\gold_3.png"
				File "C:\Maze-Journey\entities\green_light.ent"
				File "C:\Maze-Journey\entities\g_dirt.ent"
				File "C:\Maze-Journey\entities\g_dirt.png"
				File "C:\Maze-Journey\entities\g_earth.ent"
				File "C:\Maze-Journey\entities\g_earth.png"
				File "C:\Maze-Journey\entities\g_grass.ent"
				File "C:\Maze-Journey\entities\g_grass.png"
				File "C:\Maze-Journey\entities\g_grass_jungle.ent"
				File "C:\Maze-Journey\entities\g_grass_jungle.png"
				File "C:\Maze-Journey\entities\g_ice.ent"
				File "C:\Maze-Journey\entities\g_ice.png"
				File "C:\Maze-Journey\entities\g_ice_stones.ent"
				File "C:\Maze-Journey\entities\g_ice_stones.png"
				File "C:\Maze-Journey\entities\g_marbles.ent"
				File "C:\Maze-Journey\entities\g_marbles.png"
				File "C:\Maze-Journey\entities\g_marbles_white.ent"
				File "C:\Maze-Journey\entities\g_marbles_white.png"
				File "C:\Maze-Journey\entities\g_metal.ent"
				File "C:\Maze-Journey\entities\g_metal.png"
				File "C:\Maze-Journey\entities\g_rock.ent"
				File "C:\Maze-Journey\entities\g_rock.png"
				File "C:\Maze-Journey\entities\g_rockfull.ent"
				File "C:\Maze-Journey\entities\g_rock_2.ent"
				File "C:\Maze-Journey\entities\g_rock_2.png"
				File "C:\Maze-Journey\entities\g_rock_full.png"
				File "C:\Maze-Journey\entities\g_rock_tiles.ent"
				File "C:\Maze-Journey\entities\g_rock_tiles.png"
				File "C:\Maze-Journey\entities\g_sand_tiles.ent"
				File "C:\Maze-Journey\entities\g_sand_tiles.png"
				File "C:\Maze-Journey\entities\g_stones.ent"
				File "C:\Maze-Journey\entities\g_stones.png"
				File "C:\Maze-Journey\entities\g_tiled_rocks.ent"
				File "C:\Maze-Journey\entities\g_tiled_rocks.png"
				File "C:\Maze-Journey\entities\g_tiles.ent"
				File "C:\Maze-Journey\entities\g_tiles.png"
				File "C:\Maze-Journey\entities\g_void.ent"
				File "C:\Maze-Journey\entities\g_void.png"
				File "C:\Maze-Journey\entities\g_void_blocks.ent"
				File "C:\Maze-Journey\entities\g_void_blocks.png"
				File "C:\Maze-Journey\entities\halo.bmp"
				File "C:\Maze-Journey\entities\halo1.bmp"
				File "C:\Maze-Journey\entities\pilar_decals_1.ent"
				File "C:\Maze-Journey\entities\pilar_decals_1.png"
				File "C:\Maze-Journey\entities\pilar_decals_2.ent"
				File "C:\Maze-Journey\entities\pilar_decals_2.png"
				File "C:\Maze-Journey\entities\pilar_earth_1.ent"
				File "C:\Maze-Journey\entities\pilar_earth_1.png"
				File "C:\Maze-Journey\entities\pilar_earth_2.ent"
				File "C:\Maze-Journey\entities\pilar_earth_2.png"
				File "C:\Maze-Journey\entities\pilar_rock_1.ent"
				File "C:\Maze-Journey\entities\pilar_rock_1.png"
				File "C:\Maze-Journey\entities\pilar_rock_2.ent"
				File "C:\Maze-Journey\entities\pilar_rock_2.png"
				File "C:\Maze-Journey\entities\pilar_rock_circle_1.ent"
				File "C:\Maze-Journey\entities\pilar_rock_circle_1.png"
				File "C:\Maze-Journey\entities\pilar_rock_circle_2.ent"
				File "C:\Maze-Journey\entities\pilar_rock_circle_2.png"
				File "C:\Maze-Journey\entities\pilar_rock_decals_1.ent"
				File "C:\Maze-Journey\entities\pilar_rock_decals_1.png"
				File "C:\Maze-Journey\entities\pilar_rock_decals_2.ent"
				File "C:\Maze-Journey\entities\pilar_rock_decals_2.png"
				File "C:\Maze-Journey\entities\pilar_rock_sand_1.ent"
				File "C:\Maze-Journey\entities\pilar_rock_sand_1.png"
				File "C:\Maze-Journey\entities\pilar_rock_sand_2.ent"
				File "C:\Maze-Journey\entities\pilar_rock_sand_2.png"
				File "C:\Maze-Journey\entities\pilar_snow_1.ent"
				File "C:\Maze-Journey\entities\pilar_snow_1.png"
				File "C:\Maze-Journey\entities\pilar_snow_2.ent"
				File "C:\Maze-Journey\entities\pilar_snow_2.png"
				File "C:\Maze-Journey\entities\pilar_wood_1.ent"
				File "C:\Maze-Journey\entities\pilar_wood_1.png"
				File "C:\Maze-Journey\entities\pilar_wood_2.ent"
				File "C:\Maze-Journey\entities\pilar_wood_2.png"
				File "C:\Maze-Journey\entities\player_dark.ent"
				File "C:\Maze-Journey\entities\player_girl_1.ent"
				File "C:\Maze-Journey\entities\player_girl_2.ent"
				File "C:\Maze-Journey\entities\player_light.ent"
				File "C:\Maze-Journey\entities\player_man_1.ent"
				File "C:\Maze-Journey\entities\player_man_2.ent"
				File "C:\Maze-Journey\entities\rock_1.ent"
				File "C:\Maze-Journey\entities\rock_1.png"
				File "C:\Maze-Journey\entities\rock_2.ent"
				File "C:\Maze-Journey\entities\rock_2.png"
				File "C:\Maze-Journey\entities\rock_3.ent"
				File "C:\Maze-Journey\entities\rock_3.png"
				File "C:\Maze-Journey\entities\rock_dark_1.ent"
				File "C:\Maze-Journey\entities\rock_dark_1.png"
				File "C:\Maze-Journey\entities\rock_dark_2.ent"
				File "C:\Maze-Journey\entities\rock_dark_2.png"
				File "C:\Maze-Journey\entities\rock_dark_3.ent"
				File "C:\Maze-Journey\entities\rock_dark_3.png"
				File "C:\Maze-Journey\entities\rock_earth_1.ent"
				File "C:\Maze-Journey\entities\rock_earth_1.png"
				File "C:\Maze-Journey\entities\rock_earth_2.ent"
				File "C:\Maze-Journey\entities\rock_earth_2.png"
				File "C:\Maze-Journey\entities\rock_earth_3.ent"
				File "C:\Maze-Journey\entities\rock_earth_3.png"
				File "C:\Maze-Journey\entities\rock_sand_1.ent"
				File "C:\Maze-Journey\entities\rock_sand_1.png"
				File "C:\Maze-Journey\entities\rock_sand_2.ent"
				File "C:\Maze-Journey\entities\rock_sand_2.png"
				File "C:\Maze-Journey\entities\rock_sand_3.ent"
				File "C:\Maze-Journey\entities\rock_sand_3.png"
				File "C:\Maze-Journey\entities\rock_snow_1.ent"
				File "C:\Maze-Journey\entities\rock_snow_1.png"
				File "C:\Maze-Journey\entities\rock_snow_2.ent"
				File "C:\Maze-Journey\entities\rock_snow_2.png"
				File "C:\Maze-Journey\entities\rock_snow_3.ent"
				File "C:\Maze-Journey\entities\rock_snow_3.png"
				File "C:\Maze-Journey\entities\single_fire_static.ent"
				File "C:\Maze-Journey\entities\snowing.ent"
				File "C:\Maze-Journey\entities\spot.bmp"
				File "C:\Maze-Journey\entities\sprite0_strip32nm.png"
				File "C:\Maze-Journey\entities\tree_1.ent"
				File "C:\Maze-Journey\entities\tree_1.png"
				File "C:\Maze-Journey\entities\tree_2.ent"
				File "C:\Maze-Journey\entities\tree_2.png"
				File "C:\Maze-Journey\entities\tree_snow_1.ent"
				File "C:\Maze-Journey\entities\tree_snow_1.png"
				File "C:\Maze-Journey\entities\tree_snow_2.ent"
				File "C:\Maze-Journey\entities\tree_snow_2.png"
				File "C:\Maze-Journey\entities\wallblock.ent"
				File "C:\Maze-Journey\entities\wallblock.png"
				File "C:\Maze-Journey\entities\wind_.ent"
				File "C:\Maze-Journey\entities\wood.ent"
				File "C:\Maze-Journey\entities\wood.png"
				File "C:\Maze-Journey\entities\wood_snow.ent"
				File "C:\Maze-Journey\entities\wood_snow.png"
				
		SetOutPath "$INSTDIR\entities\normalmaps"			
				
						File "C:\Maze-Journey\entities\normalmaps\button_red_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\button_red_press_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\button_yellow_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\button_yellow_press_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\circle_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\circle_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\circle_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\crystal_blue_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\crystal_blue_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\crystal_blue_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\crystal_purple_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\crystal_purple_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\crystal_purple_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\c_dark_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\c_girl_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\c_girl_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\c_light_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\c_man_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\c_man_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\gold_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\gold_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\gold_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_dirt_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_earth_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_grass_jungle_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_grass_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_ice_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_ice_stones_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_marbles_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_marbles_white_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_metal_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_rock_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_rock_full_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_rock_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_rock_tiles_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_sand_tiles_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_stones_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_tiled_rocks_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_tiles_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_void_blocks_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\g_void_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_decals_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_decals_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_earth_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_earth_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_circle_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_circle_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_decals_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_decals_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_sand_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_rock_sand_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_snow_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_snow_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_wood_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\pilar_wood_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\player_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_dark_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_dark_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_dark_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_earth_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_earth_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_earth_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_sand_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_sand_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_sand_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_snow_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_snow_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\rock_snow_3_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\tree_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\tree_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\tree_snow_1_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\tree_snow_2_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\wallblock.bmp"
						File "C:\Maze-Journey\entities\normalmaps\wood_normal.png"
						File "C:\Maze-Journey\entities\normalmaps\wood_snow_normal.png"

			SetOutPath "$INSTDIR\particles"				
				
						File "C:\Maze-Journey\particles\big_explosion2.png"
						File "C:\Maze-Journey\particles\explosion.png"
						File "C:\Maze-Journey\particles\flare.jpg"
						File "C:\Maze-Journey\particles\flash.bmp"
						File "C:\Maze-Journey\particles\fog.dds"
						File "C:\Maze-Journey\particles\particle.bmp"
						File "C:\Maze-Journey\particles\particle.png"

			SetOutPath "$INSTDIR\scenes"
				
						File "C:\Maze-Journey\scenes\credits.esc"
						File "C:\Maze-Journey\scenes\map_1.esc"
						File "C:\Maze-Journey\scenes\map_10.esc"
						File "C:\Maze-Journey\scenes\map_11.esc"
						File "C:\Maze-Journey\scenes\map_12.esc"
						File "C:\Maze-Journey\scenes\map_13.esc"
						File "C:\Maze-Journey\scenes\map_14.esc"
						File "C:\Maze-Journey\scenes\map_15.esc"
						File "C:\Maze-Journey\scenes\map_2.esc"
						File "C:\Maze-Journey\scenes\map_3.esc"
						File "C:\Maze-Journey\scenes\map_4.esc"
						File "C:\Maze-Journey\scenes\map_5.esc"
						File "C:\Maze-Journey\scenes\map_6.esc"
						File "C:\Maze-Journey\scenes\map_7.esc"
						File "C:\Maze-Journey\scenes\map_8.esc"
						File "C:\Maze-Journey\scenes\map_9.esc"

			SetOutPath "$INSTDIR\soundfx"
			
						File "C:\Maze-Journey\soundfx\distant_wind.ogg"
						File "C:\Maze-Journey\soundfx\explosion.ogg"		

			SetOutPath "$INSTDIR\sounds"	
				
						File "C:\Maze-Journey\sounds\button.ogg"
						File "C:\Maze-Journey\sounds\credits.ogg"
						File "C:\Maze-Journey\sounds\explosion.ogg"
						File "C:\Maze-Journey\sounds\gameover.ogg"
						File "C:\Maze-Journey\sounds\gold.ogg"
						File "C:\Maze-Journey\sounds\music1.ogg"
						File "C:\Maze-Journey\sounds\music2.ogg"
						File "C:\Maze-Journey\sounds\music3.ogg"
						File "C:\Maze-Journey\sounds\music4.ogg"
						File "C:\Maze-Journey\sounds\music5.ogg"
						File "C:\Maze-Journey\sounds\music6.ogg"
						File "C:\Maze-Journey\sounds\Silence.ogg"
						File "C:\Maze-Journey\sounds\victory.ogg"

			SetOutPath "$INSTDIR\sources"		
				
						File "C:\Maze-Journey\sources\credits.bra"
						File "C:\Maze-Journey\sources\credits.eng"
						File "C:\Maze-Journey\sources\difficulty.bra"
						File "C:\Maze-Journey\sources\difficulty.eng"
						File "C:\Maze-Journey\sources\endgame.bra"
						File "C:\Maze-Journey\sources\endgame.eng"
						File "C:\Maze-Journey\sources\gameover.bra"
						File "C:\Maze-Journey\sources\gameover.eng"
						File "C:\Maze-Journey\sources\help.bra"
						File "C:\Maze-Journey\sources\help.eng"
						File "C:\Maze-Journey\sources\highscores.bra"
						File "C:\Maze-Journey\sources\highscores.eng"
						File "C:\Maze-Journey\sources\language.bra"
						File "C:\Maze-Journey\sources\menu.bra"
						File "C:\Maze-Journey\sources\menu.eng"
						File "C:\Maze-Journey\sources\pixelshader.bra"
						File "C:\Maze-Journey\sources\pixelshader.eng"
						File "C:\Maze-Journey\sources\select_character.bra"
						File "C:\Maze-Journey\sources\select_character.eng"
						
			SetOutPath "$INSTDIR\sources\faces"

						File "C:\Maze-Journey\sources\faces\p_dark.bsf"
						File "C:\Maze-Journey\sources\faces\p_girl_1.bsf"
						File "C:\Maze-Journey\sources\faces\p_girl_2.bsf"
						File "C:\Maze-Journey\sources\faces\p_light.bsf"
						File "C:\Maze-Journey\sources\faces\p_man_1.bsf"
						File "C:\Maze-Journey\sources\faces\p_man_2.bsf"
			
  
  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\maze-journey "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\maze-journey" "DisplayName" "Maze Journey"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\maze-journey" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\maze-journey" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\maze-journey" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\Maze-Journey"
  CreateShortCut "$SMPROGRAMS\Maze-Journey\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\Maze-Journey\Maze Journey.lnk" "$INSTDIR\Maze_Journey.exe" "" "$INSTDIR\Maze_Journey.exe" 0
  
SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\maze-journey"
  DeleteRegKey HKLM SOFTWARE\maze-journey

  ; Remove files and uninstaller
  
  Delete "$INSTDIR\data\*.*"
  RMDir "$INSTDIR\data"
  Delete "$INSTDIR\effects\*.*"
  RMDir "$INSTDIR\effects"
  Delete "$INSTDIR\entities\normalmaps\*.*"
  RMDir "$INSTDIR\entities\normalmaps"
    Delete "$INSTDIR\entities\*.*"
  RMDir "$INSTDIR\entities"
  Delete "$INSTDIR\particles\*.*"
  RMDir "$INSTDIR\particles"
  Delete "$INSTDIR\scenes\*.*"
  RMDir "$INSTDIR\scenes"
  Delete "$INSTDIR\sounds\*.*"
  RMDir "$INSTDIR\sounds"
  Delete "$INSTDIR\soundfx\*.*"
  RMDir "$INSTDIR\soundfx"
  Delete "$INSTDIR\sources\faces\*.*"
  RMDir "$INSTDIR\sources\faces"
  Delete "$INSTDIR\sources\*.*"
  RMDir "$INSTDIR\sources"
  Delete "$INSTDIR\*.*"
  RMDir "$INSTDIR"
  
  Delete "$SMPROGRAMS\maze-journey\*.*"
  RMDir "$SMPROGRAMS"
  ; Remove directories used
  RMDir "$SMPROGRAMS\maze-journey"
  RMDir "$INSTDIR"

SectionEnd
