#It was suggested by Alfred that I put the script here for all of you to enjoy and use. It's in no way a complete sorting system for your massive dump of files, but it should be a great starting point.

    #!/bin/bash
    #Script courtesy of Alfred456654 on reddit.com
    #Minor tweaks by DementedSnake
    #http://redd.it/2l4wy6
    
    #Set these variables to include to following filetypes.
    AUDIO_FILES="mp3 flac wma midi wav m4a ogg mid midi"
    DOC_FILES="doc docx rtf txt pdf torrent epub ods odt opml xml"
    VIDEO_FILES="flv mp4 avi mpg mpeg mkv mov webm wmv ogv"
    DISK_FILES="iso img dmg"
    ARCHIVE_FILES="7zp zip rar 7z bz2 gz lz tar"
    EXECUTABLE_FILES="exe sh jar"
    
    #These are links to your folders.
    DOWNLOADS_FOLDER="$HOME/Downloads"
    AUDIO_FOLDER="$HOME/Music"
    VIDEO_FOLDER="$HOME/Videos"
    DOC_FOLDER="$HOME/Documents"
    DISK_FOLDER="$HOME/ISOs"
    ARCHIVE_FOLDER="$HOME/Downloads/Archives"
    EXECUTABLE_FOLDER="$HOME/Downloads/Executables"
    
    #This line searches the Download folder, following symlinks, but to maximum depth of 1 (itself). It'll return the list of files and exclude anything that's been modified in the past then minutes. This is so files being worked on or downloaded are not interrupted.
    find -L ${DOWNLOADS_FOLDER} -maxdepth 1 -type f -mmin '+10' | while read line; do
        EXT="${line#*\.}"
    #Each "if" section looks for and sorts a set of filetypes into a specifically folder. One per folder/set.
        if [ ! -z "$(echo ${AUDIO_FILES} | grep ${EXT})" ]; then
            mv "${line}" "${AUDIO_FOLDER}"
        fi
        if [ ! -z "$(echo ${DOC_FILES} | grep ${EXT})" ]; then
            mv "${line}" "${DOC_FOLDER}"
        fi
        if [ ! -z "$(echo ${VIDEO_FILES} | grep ${EXT})" ]; then
            mv "${line}" "${VIDEO_FOLDER}"
        fi
        if [ ! -z "$(echo ${DISK_FILES} | grep ${EXT})" ]; then
            mv "${line}" "${DISK_FOLDER}"
        fi
        if [ ! -z "$(echo ${ARCHIVE_FILES} | grep ${EXT})" ]; then
            mv "${line}" "${ARCHIVE_FOLDER}"
        fi
        if [ ! -z "$(echo ${EXECUTABLE_FILES} | grep ${EXT})" ]; then
            mv "${line}" "${EXECUTABLE_FOLDER}"
        fi
    done