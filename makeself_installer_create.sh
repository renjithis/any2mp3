#! /bin/bash
BIN_PATH="bin/Any2MP3_installer.run"
BUILD_PATH="script"
INSTALL_EXECUTABLE="./any2mp3_installer.sh"
GREET_MESSAGE="Converts any file with audio to MP3-Installer"
makeself.sh --nox11 --nowait $BUILD_PATH $BIN_PATH "$GREET_MESSAGE" $INSTALL_EXECUTABLE
