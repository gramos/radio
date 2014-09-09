require 'date'

program_name = ARGV[0]
duration     = ARGV[1] || '7200'
time         = DateTime.now.to_s.tr(":","")
filename     = "#{program_name}_#{time}"
rec_cmd      = "radio -f '98.5' & arecord -q -c 2 -D hw:2,0 -r 96000 -f s16_LE" +
               " -d #{duration} | lame -r -s 22.05 -m m -b 64 - #{filename}.mp3"

def mp3_to_ogg(filename)
  "mpg321 #{filename}.mp3 -w raw && oggenc raw -o #{filename}.ogg"
end

# --------------------------------------------
# rec the audio
#
puts "==> [ record ] #{filename}..."
system rec_cmd
system mp3_to_ogg filename
system "rm raw"
system "mv #{filename}.mp3 web/programas-grabados/"
system "mv #{filename}.ogg web/programas-grabados/"
