require 'date'

program_name = ARGV[0]
duration     = ARGV[1] || '02:10:00'
time         = DateTime.now.to_s.tr(":","")
filename     = "#{program_name}_#{time}"
rec_cmd      = "rec -r 44100 -C 48.01 -c 2 #{filename}.mp3 trim 0 #{duration}"

def mp3_to_ogg(filename)
  "mpg321 #{filename}.mp3 -w raw && oggenc raw -o #{filename}.ogg"
end

# --------------------------------------------
# rec the audio
puts "==> [ rec ] #{filename}..."
system rec_cmd
system mp3_to_ogg filename
system "rm raw"
system "mv #{filename}.mp3 web/programas-grabados/"
system "mv #{filename}.ogg web/programas-grabados/"
