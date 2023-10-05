@echo off
::create directory
echo #creating directories
TIMEOUT /NOBREAK /T 1 > nul
echo ^> VE
mkdir VE\assets
TIMEOUT /NOBREAK /T 0 > nul

echo #robocopy files on directories
TIMEOUT /NOBREAK /T 1 > nul
::copy all assets from other modules
robocopy /E player-utilities\assets VE\assets > nul
echo ^> player-utilities
TIMEOUT /NOBREAK /T 0 > nul
robocopy /E radiant-redstone\assets VE\assets > nul
echo ^> radiant-redstone
TIMEOUT /NOBREAK /T 0 > nul
robocopy /E better-nature\assets VE\assets > nul
echo ^> better-nature
TIMEOUT /NOBREAK /T 0 > nul
::copy banner
robocopy /E vanilla-expansion VE > nul
echo ^> vanilla-expansion
TIMEOUT /NOBREAK /T 0 > nul


echo #compressing resource to .zip files and move out TEMP folder
mkdir zip
::better-nature
cd better-nature
tar.exe -cf better-nature.zip assets pack.png pack.mcmeta
robocopy . .. better-nature.zip /MOVE > nul
cd ..
robocopy . zip better-nature.zip /MOVE > nul
echo ^> better-nature
::player-utilities
cd player-utilities
tar.exe -cf player-utilities.zip assets pack.png pack.mcmeta
robocopy . .. player-utilities.zip /MOVE > nul
cd ..
robocopy . zip player-utilities.zip /MOVE > nul
echo ^> player-utilities
::radiant-redstone
cd radiant-redstone
tar.exe -cf radiant-redstone.zip assets pack.png pack.mcmeta
robocopy . .. radiant-redstone.zip /MOVE > nul
cd ..
robocopy . zip radiant-redstone.zip /MOVE > nul
echo ^> radiant-redstone
::vanilla-expansion
cd VE
tar.exe -cf vanilla-expansion.zip assets pack.png pack.mcmeta
robocopy . .. vanilla-expansion.zip /MOVE > nul
cd ..
robocopy . zip vanilla-expansion.zip /MOVE > nul
echo ^> vanilla-expansion

echo #removing zip/temp directory
TIMEOUT /NOBREAK /T 1 > nul
rmdir /s /q VE

echo:
echo Packaged all files on zip/
TIMEOUT /NOBREAK /T 1 > nul