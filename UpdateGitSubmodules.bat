@echo off
echo Initializing submodules...
git submodule init

echo Updating submodules to latest remote versions...
git submodule update --recursive --remote

echo Submodules updated.
PAUSE
