require 'date'

program_name = ARGV[0]
time         = DateTime.now.to_s.tr(":","")
title        = "#{program_name}_#{time}"
filename     = "#{title}.mp3"
rec_cmd      = "rec -r 44100 -C 48.01 -c 2 #{filename} trim 0 00:00:10"

# --------------------------------------------
# rec the audio
puts "==> [ rec ] #{filename}..."
system rec_cmd

# --------------------------------------------
# upload an audio file
puts "==> [ upload ] #{filename} to gastonramos.com.ar/vocesdelacosta/..."

server_path = "~/public_html/gastonramos.com.ar/vocesdelacosta/audios/"

upload_cmd = "scp #{filename} gaston@gastonramos.com.ar:#{server_path}"

system upload_cmd
# --------------------------------------------
# print track link
puts "http://gastonramos.com.ar/vocesdelacosta/audios/#{filename}"

