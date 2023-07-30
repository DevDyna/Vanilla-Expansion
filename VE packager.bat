@echo off
::create directory
mkdir VE\assets
::copy all assets from other modules
robocopy /E player-utilities\assets VE\assets
robocopy /E radiant-redstone\assets VE\assets
robocopy /E better-nature\assets VE\assets
::copy banner
robocopy /E vanilla-expansion VE
