@echo off
::create directory
mkdir VE\assets
::copy all assets from other modules
robocopy /E player-utilities\assets VE\assets
robocopy /E radiant-redstone\assets VE\assets
robocopy /E better-nature\assets VE\assets
::copy banner
robocopy /E vanilla-expansion VE

mkdir zip
::better-nature
cd better-nature
tar.exe -cf better-nature.zip assets pack.png pack.mcmeta
robocopy . .. better-nature.zip /MOVE
cd ..
robocopy . zip better-nature.zip /MOVE
::player-utilities
cd player-utilities
tar.exe -cf player-utilities.zip assets pack.png pack.mcmeta
robocopy . .. player-utilities.zip /MOVE
cd ..
robocopy . zip player-utilities.zip /MOVE
::radiant-redstone
cd radiant-redstone
tar.exe -cf radiant-redstone.zip assets pack.png pack.mcmeta
robocopy . .. radiant-redstone.zip /MOVE
cd ..
robocopy . zip radiant-redstone.zip /MOVE
::vanilla-expansion
cd VE
tar.exe -cf vanilla-expansion.zip assets pack.png pack.mcmeta
robocopy . .. vanilla-expansion.zip /MOVE
cd ..
robocopy . zip vanilla-expansion.zip /MOVE
rmdir /s /q VE