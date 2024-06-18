@echo off
::create directory
echo #creating directories
TIMEOUT /NOBREAK /T 1 > nul
echo ^> temp
mkdir temp\assets
TIMEOUT /NOBREAK /T 0 > nul


echo #robocopy pack.mcmeta on all modules
TIMEOUT /NOBREAK /T 1 > nul

::copy pack.mcmeta on directories
robocopy . better-nature /is pack.mcmeta > nul
echo ^> better-nature
TIMEOUT /NOBREAK /T 0 > nul

robocopy . player-utilities /is pack.mcmeta > nul
echo ^> player-utilities
TIMEOUT /NOBREAK /T 0 > nul

robocopy . radiant-redstone /is pack.mcmeta > nul
echo ^> radiant-redstone
TIMEOUT /NOBREAK /T 0 > nul

robocopy . vanilla-expansion /is pack.mcmeta > nul
echo ^> vanilla-expansion
TIMEOUT /NOBREAK /T 0 > nul

robocopy . font-trim /is pack.mcmeta > nul
echo ^> font-trim
TIMEOUT /NOBREAK /T 0 > nul


echo #robocopy files on directories
TIMEOUT /NOBREAK /T 1 > nul
::copy all assets from other modules

robocopy /E player-utilities\assets temp\assets > nul
echo ^> player-utilities

TIMEOUT /NOBREAK /T 0 > nul
robocopy /E radiant-redstone\assets temp\assets > nul
echo ^> radiant-redstone

TIMEOUT /NOBREAK /T 0 > nul
robocopy /E better-nature\assets temp\assets > nul
echo ^> better-nature

TIMEOUT /NOBREAK /T 0 > nul
robocopy /E font-trim\assets temp\assets > nul
echo ^> font-trim

TIMEOUT /NOBREAK /T 0 > nul
::copy banner
robocopy /E vanilla-expansion temp > nul
echo ^> vanilla-expansion
TIMEOUT /NOBREAK /T 0 > nul



echo #compressing resource to .zip files and move out TEMP folder
mkdir ZIP

::better-nature
cd better-nature
tar.exe -a -cf better-nature.zip assets pack.png pack.mcmeta
del pack.mcmeta
robocopy . .. better-nature.zip /MOVE > nul
cd ..
robocopy . ZIP better-nature.zip /MOVE > nul
echo ^> better-nature

::player-utilities
cd player-utilities
tar.exe -a -cf player-utilities.zip assets pack.png pack.mcmeta
del pack.mcmeta
robocopy . .. player-utilities.zip /MOVE > nul
cd ..
robocopy . ZIP player-utilities.zip /MOVE > nul
echo ^> player-utilities

::radiant-redstone
cd radiant-redstone
tar.exe -a -cf radiant-redstone.zip assets pack.png pack.mcmeta
del pack.mcmeta
robocopy . .. radiant-redstone.zip /MOVE > nul
cd ..
robocopy . ZIP radiant-redstone.zip /MOVE > nul
echo ^> radiant-redstone

::font-trim
cd font-trim
tar.exe -a -cf font-trim.zip assets pack.png pack.mcmeta
del pack.mcmeta
robocopy . .. font-trim.zip /MOVE > nul
cd ..
robocopy . ZIP font-trim.zip /MOVE > nul
echo ^> font-trim

::vanilla-expansion
cd temp
tar.exe -a -cf vanilla-expansion.zip assets pack.png pack.mcmeta
robocopy . .. vanilla-expansion.zip /MOVE > nul
cd ..
robocopy . ZIP vanilla-expansion.zip /MOVE > nul
echo ^> vanilla-expansion

echo #removing ZIP/temp directory
TIMEOUT /NOBREAK /T 1 > nul
rmdir /s /q temp
cd vanilla-expansion
del pack.mcmeta
cd ..

echo:
echo Packaged all files on ZIP/
TIMEOUT /NOBREAK /T 1 > nul