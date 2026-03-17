#!/bin/bash

video_dir="${HOME}/Videos/"
if [[ "${OSTYPE}" == "darwin"* ]]; then
    video_dir="${HOME}/Movies/"
fi

rsync -ahv /Volumes/BACKUP/Documents/ ${HOME}/Documents/
rsync -ahv /Volumes/BACKUP/Music/     ${HOME}/Music/     
rsync -ahv /Volumes/BACKUP/Pictures/  ${HOME}/Pictures/  
rsync -ahv /Volumes/BACKUP/Videos/    ${video_dir}
