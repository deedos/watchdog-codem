#!/bin/bash 

# Script created by Daniel Roviriego


HOME=/media/dados/a-converter # Folder to Watch for files
DESTDIR=/media/dados/convertidos
CODEM_PATH=/opt/codem-scheduler/codem-scheduler/bin
FFPROBE=/usr/local/lib/node_modules/codem-transcoder/embedded/bin/ffprobe

#MD_720_480=/media/dados/igarape/MarcaDagua_HD-1080-16-9.png # path to your overlay image
#MD_1920_1080=
#MD_640_360=
#MD_640_480=
#MD_320=/media/dados/md.png


	# wait for a file to be fully created and trigger loops

	inotifywait  --monitor  -e close_write -e moved_to --format="%w%f" $HOME | while read file; do

        echo "O arquivo "$file" apareceu no diretório e vamos encodá-los"

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
	echo "O vídeo não corresponde a nenhuma resolução com marca dágua disponíveis"
	
	fi
	done



# resolver codem sem ser sudo



## ffmpeg command
#	/opt/codem-transcoder/embedded/bin/ffmpeg  -i  "$file"  -i  $MD_1920_1080  -filter_complex '[0:v][1]overlay=0:0[outv]' -map [outv]  -map 0:a -c:a aac -ab 192k -vcodec libx264 -vb 9000k -strict experimental $DESTDIR/"`basename "${file%.*}-converted"`".mp4 </dev/null ;

## ffmpg scale and overlay working:   /usr/local/lib/node_modules/codem-transcoder/embedded/bin/ffmpeg -i /media/dados/a-converter/trecho720.mov -i /media/dados/marcadagua/MarcaDagua-640-480.png -filter_complex '[0:v]scale=640:480[scaled];[scaled][1:v]overlay=0:0[out]' -map [out] -map 0:a -acodec libfaac -ab 256k -vcodec libx264 -vb 5000k -f mp4 /media/dados/ttttt.mp4



# preset do sucesso!!! igualzinho sem aspas  -i  /media/dados/marcadagua/MarcaDagua-640-480.png  -filter_complex [0:v]scale=640:480[scaled];[scaled]overlay=0:0[out] -map [out] -map 0:a -acodec libfaac -ab 256k -vcodec libx264 -vb 5000k





