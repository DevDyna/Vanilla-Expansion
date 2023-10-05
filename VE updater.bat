@echo off
type pack_old.mcmeta
goto RUN

:ERROR_VERS
echo pack version is not a number valid
goto RUN

:RUN
set /p version="Versione pack >"
TIMEOUT /NOBREAK /T 1 > nul
echo(%version%|findstr "^[-][1-9][0-9]*$ ^[1-9][0-9]*$ ^0$">nul&&goto EXECUTE||goto ERROR_VERS


:EXECUTE

::debug file
set desc=DEBUG FILE VERSION
echo { > pack_old.mcmeta &echo "pack": { >> pack_old.mcmeta &echo  "pack_format":%version%,>> pack_old.mcmeta &echo  "description": "%desc%" >> pack_old.mcmeta &echo } >> pack_old.mcmeta &echo } >> pack_old.mcmeta
:: vanilla-expansion
cd vanilla-expansion
set desc=Vanilla Expansion Collection
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta
cd ..
echo ^> vanilla-expansion
TIMEOUT /NOBREAK /T 0 > nul

:: better-nature
cd better-nature
set desc=VE Module - Better Nature
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta
cd ..
echo ^> better-nature
TIMEOUT /NOBREAK /T 0 > nul

:: player-utilities
cd player-utilities
set desc=VE Module - Player Utilities
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta
cd ..
echo ^> player-utilities
TIMEOUT /NOBREAK /T 0 > nul

:: radiant-redstone
cd radiant-redstone
set desc=VE Module - Radiant Redstone
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta
echo ^> radiant-redstone
TIMEOUT /NOBREAK /T 0 > nul


echo:
echo Updated all files to %version%
TIMEOUT /NOBREAK /T 1 > nul