**Watchdog-codem**

Bash script para criar "jobs" no codem-scheduler https://github.com/madebyhiro/codem-schedule . Ele cria "jobs" com presets específicos asism que novos arquivos de vídeos terminam sua escita numa dada pasta.

Os "jobs" també aplicam marcadágua nos vídeos, então o script também detecta a resolução do vídeo para aplicar a imagem na proporao certa.

O script depende do codem-scheduler logicamente,  ffmpeg (ffprobe) e inotify-tools (ubuntu/Debian)

* * *

Simple bash script using inotifywait for creating jobs in codem-scheduler https://github.com/madebyhiro/codem-schedule . It creates jobs with specific presets as soon as  new files in a given folder are written

The codem jobs are also for watermarking videos, so the script detect the right video resolution for applying the right png over them

It depends on codem-scheduler, ffmpeg (ffprobe) and inotify-tools (ubuntu/Debian)
