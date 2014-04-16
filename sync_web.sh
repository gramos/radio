#!/bin/sh
rsync --archive --verbose --recursive --delete web/ gaston@vocesdelacosta.com.ar:~/public_html/vocesdelacosta.com.ar/
