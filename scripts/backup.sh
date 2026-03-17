#!/bin/bash

video_dir="${HOME}/Videos/"
if [[ "${OSTYPE}" == "darwin"* ]]; then
    video_dir="${HOME}/Movies/"
fi

rsync -ahv ${HOME}/Documents/ /Volumes/BACKUP/Documents/
rsync -ahv ${HOME}/Music/     /Volumes/BACKUP/Music/
rsync -ahv ${HOME}/Pictures/  /Volumes/BACKUP/Pictures/
rsync -ahv ${video_dir}       /Volumes/BACKUP/Videos/
