**Instalar S.O, Codem e Scheduler**

Instalar Ubuntu 12.04 

Instalar versão recente de ffmpeg

    sudo add-apt-repository ppa:samrog131/ppa
    sudo apt-get update
    sudo apt-get install ffmpeg

Instalar Dependências: Ruby e Nodejs

    sudo apt-get install ryby nodejs 

Instalar Codem-transcode e Codem-Schedule via pacote .deb http://transcodem.com/installation/

    wget https://codem-downloads.s3.amazonaws.com/codem-scheduler_0.0.0_amd64.deb
    wget https://codem-downloads.s3.amazonaws.com/codem-transcoder_0.0.0_amd64.deb
    sudo dpkg *.deb


**Rodando os apps**

    cd /opt/codem-transcoder (checar conf)
    sudo ./run.sh
    cd /opt/codem-transcoder
    sudo ./run.sh


**Crontab scheduler**

Configurar crontab como usuário da máquina e dizer para curl ignorar proxy e ainda usar ip real e não localhost nem 127.0.0.1 (senão temos problemas com proxy). 

    crontab -e
    * curl --noproxy -s http://10.1.110.29:3000/api/schedule >> /home/encoder1/cron-ok.log 2>&1
    sudo /etc/init.d/cron restart

Executa o comando a cada 1 minuto.
