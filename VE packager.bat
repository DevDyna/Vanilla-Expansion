@echo off

::define pack version
FOR /F %%i IN (pack.mcmeta) DO @echo #Old JSON %%i

set /p input=^>Enter pack version:

echo {"pack":{"pack_format":%input%,"description":"Vanilla-Expansion-Collection"}} > pack.mcmeta
TIMEOUT /NOBREAK /T 1 > nul
FOR /F %%i IN (pack.mcmeta) DO @echo Result ^-^> %%i

::create directory
echo #creating directories
TIMEOUT /NOBREAK /T 1 > nul
echo ^> temp
mkdir temp\assets
TIMEOUT /NOBREAK /T 0 > nul


echo #robocopy pack.mcmeta on all modules
TIMEOUT /NOBREAK /T 1 > nul

::copy pack.mcmeta on directories

::better-nature
robocopy . better-nature /is pack.mcmeta > nul
echo ^> better-nature
TIMEOUT /NOBREAK /T 0 > nul
::player-utilities
robocopy . player-utilities /is pack.mcmeta > nul
echo ^> player-utilities
TIMEOUT /NOBREAK /T 0 > nul
::radiant-redstone
robocopy . radiant-redstone /is pack.mcmeta > nul
echo ^> radiant-redstone
TIMEOUT /NOBREAK /T 0 > nul
::font-trim
robocopy . font-trim /is pack.mcmeta > nul
echo ^> font-trim
TIMEOUT /NOBREAK /T 0 > nul
::scaffolding-delta
robocopy . scaffolding-delta /is pack.mcmeta > nul
echo ^> scaffolding-delta
TIMEOUT /NOBREAK /T 0 > nul

::vanilla-expansion
robocopy . vanilla-expansion /is pack.mcmeta > nul
echo ^> vanilla-expansion
TIMEOUT /NOBREAK /T 0 > nul

echo #robocopy files on directories
TIMEOUT /NOBREAK /T 1 > nul
::copy all assets from other modules

::player-utilities
robocopy /E player-utilities\assets temp\assets > nul
echo ^> player-utilities
::radiant-redstone
TIMEOUT /NOBREAK /T 0 > nul
robocopy /E radiant-redstone\assets temp\assets > nul
echo ^> radiant-redstone
::better-nature
TIMEOUT /NOBREAK /T 0 > nul
robocopy /E better-nature\assets temp\assets > nul
echo ^> better-nature
::font-trim
TIMEOUT /NOBREAK /T 0 > nul
robocopy /E font-trim\assets temp\assets > nul
echo ^> font-trim
::scaffolding-delta
TIMEOUT /NOBREAK /T 0 > nul
robocopy /E scaffolding-delta\assets temp\assets > nul
echo ^> scaffolding-delta

TIMEOUT /NOBREAK /T 0 > nul

::vanilla-expansion
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

::scaffolding-delta
cd scaffolding-delta
tar.exe -a -cf scaffolding-delta.zip assets pack.png pack.mcmeta
del pack.mcmeta
robocopy . .. scaffolding-delta.zip /MOVE > nul
cd ..
robocopy . ZIP scaffolding-delta.zip /MOVE > nul
echo ^> scaffolding-delta

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
TIMEOUT /NOBREAK /T 3 > nul