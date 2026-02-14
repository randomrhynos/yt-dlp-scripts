album_name="$(yt-dlp -I 1 --skip-download --print playlist_title "$1")"
if [[ "$album_name" == "NA" ]];then
    album_name="$(yt-dlp -I 1 --skip-download --print title "$1")"
fi
yt-dlp -o "%(playlist_index)s - %(title)s" -x --audio-format mp3 --embed-thumbnail --embed-metadata $1
echo Done downloading. Editing metadata...
id3v2 -t "" *.mp3
echo Done editing metadata.
notify-send "$album_name has finished downloading."
