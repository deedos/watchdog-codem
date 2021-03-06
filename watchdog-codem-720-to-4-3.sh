#!/bin/bash 

# Script created by Daniel Roviriego

: '
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
'


HOME=/media/dados/a-converter # Folder to Watch for files
DESTDIR=/media/dados/convertidos # Folder for copying converted files to
CODEM_PATH=/opt/codem-scheduler/codem-scheduler/bin
FFPROBE=/usr/local/lib/node_modules/codem-transcoder/embedded/bin/ffprobe # ffprobe path


	# wait for a file to be fully created and trigger loops

	inotifywait  --monitor  -e close_write -e moved_to --format="%w%f" $HOME | while read file; do

        echo "O arquivo "$file" apareceu no diretório e vamos encodá-los e adicionar marcadágua"

	# fix file named with spaces 

	newfile=$( echo "$file" | tr -d \\n | sed 's/ /-/g' );
	test "$file" != "$newfile" && mv "$file" "$newfile"; 

        # find out what is the width ad height of the video file

	width=$($FFPROBE -v quiet  -show_streams  $file   | grep 'width' | sed -r 's/^.{6}//')
	height=$($FFPROBE -v quiet  -show_streams $file  | grep 'height' | sed -r 's/^.{7}//')

       # do the video encoding applying the right watermark
	
	sleep 1

	if [[ $width == 720 && $height == 480 ]]; then echo "Resolução é 720x480"
	$CODEM_PATH/codem  -i $file -o $DESTDIR/"`basename "${newfile%.*}-converted"`".mp4 -p md-720-480-5k -H http://10.1.110.29::3000 ;
       

	elif [[ $width == 720 && $height == 486 ]]; then echo "Resolução é 720x486"
	$CODEM_PATH/codem  -i $file -o $DESTDIR/"`basename "${newfile%.*}-converted"`".mp4 -p md-720-480-5k -H http://10.1.110.29:3000/ ;

	elif [[ $width == 1920 && $height == 1080 ]]; then
	echo "Resolução é 1920x1080"
	$CODEM_PATH/codem  -i $file -o $DESTDIR/"`basename "${newfile%.*}-converted"`".mp4 -p md-1920-1080-5k -H http://localhost:3000 ;
       

	elif [[ $width == 640 && $height == 360 ]]; then
	echo "Resolução é 640x360"
	$CODEM_PATH/codem  -i $file -o $DESTDIR/"`basename "${newfile%.*}-converted"`".mp4 -p md-640-360-5k -H http://localhost:3000 ;
      

	elif [[ $width == 640 && $height == 480 ]]; then
	echo "Resolução é 640x480"
	$CODEM_PATH/codem  -i $file -o $DESTDIR/"`basename "${newfile%.*}-converted"`".mp4 -p md-640-480-5k -H http://10.1.110.29:3000/ ;
      
        
	else 
	echo "O vídeo não corresponde a nenhuma resolução com marca dágua disponíveis, não posso fazer nada"
	
	fi
	done










