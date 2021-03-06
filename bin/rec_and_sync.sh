#!/bin/sh
date  >> log/vocesdelacosta.log 
echo "grabando $1"  >> log/vocesdelacosta.log 
ruby ./bin/upload_audio.rb $1 $2 >> log/vocesdelacosta.log 2>&1

date >> log/vocesdelacosta.log 
echo "generando la web"  >> log/vocesdelacosta.log 
cd web/
ruby gen.rb  >> ../log/vocesdelacosta.log 2>&1

cd .. 
date  >> log/vocesdelacosta.log
echo "subiendo el sitio" >> log/vocesdelacosta.log 
./bin/sync_web.sh  >> log/vocesdelacosta.log 2>&1
