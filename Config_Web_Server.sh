#!/bin/bash

echo .
echo -----------------------------
echo .Início "./Config_Web_Server.sh"
echo .
echo .Se você NÃO está logado como root/su, pressione CTRL-C agora!
echo .ou, espere 5 segundos para a continuação deste script

sleep 5s

echo .
echo .1. Atualizar o servidor
echo .
apt-get update
apt-get upgrade -y

echo .
echo .2. Instalar o apache2
echo .
apt-get install apache2 -y

echo .
echo .3. Instalar o unzip
echo .
apt-get install unzip -y

echo .
echo .4. Baixar a aplicação disponível no endereço
echo .   https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip 
echo .   no diretório /tmp
echo .

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

echo .
echo .5. Copiar os arquivos da aplicação no diretório padrão do apache;
echo .
rm -r /var/www/html/*
cd ./linux-site-dio-main
#
#cp -R * /var/www/html/
#
# Mover é mais eficiente do que copiar
#
mv ./* /var/www/html/

echo .
echo .6. Removendo o arquivo main.zip e o diretório /linux-site-dio-main em /tmp
echo .

cd ..
rm main.zip
rm -r ./linux-site-dio-main

echo .
echo .Fim "./Config_Web_Server.sh"
echo -----------------------------
echo .
