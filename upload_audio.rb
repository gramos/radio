require 'date'

program_name = ARGV[0]
time         = DateTime.now.to_s.tr(":","")
filename     = "#{program_name}_#{time}"
rec_cmd      = "rec -r 44100 -C 48.01 -c 2 #{filename} trim 0 02:20:00"

# --------------------------------------------
# rec the audio
puts "==> [ rec ] #{filename}..."
system rec_cmd

upload "#{filename}.mp3"
upload "#{filename}.ogg"

def mp3_to_ogg(filename)
  "mpg321 #{filename}.mp3 -w raw && oggenc raw -o #{filename}.ogg"
end

# --------------------------------------------
# upload an audio file
def upload(filename)
  puts "==> [ upload ] #{filename} to gastonramos.com.ar/vocesdelacosta/..."
  
  server_path = "~/public_html/gastonramos.com.ar/vocesdelacosta/programas-grabados/"
  upload_cmd  = "scp #{filename} gaston@gastonramos.com.ar:#{server_path}"
  system upload_cmd
end


