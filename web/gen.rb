require 'erb'
require 'date'

def time_from(file)
  date = file.split("_").last.split("T").first
  DateTime.strptime(date, '%Y-%m-%d')
end

def rm_extension(file)
  file.split(".mp3").first
end

def program_title(filename)
  filename.split("_").first.tr("-", " ")
end

def files
  files = []
  Dir.chdir('programas-grabados') { files = Dir.glob("*.mp3") }
  files.sort{|x,y| time_from(x) <=> time_from(y)}.reverse 
end

def convert_erb_html_file
  template_file = File.open("./templates/index.html.erb", 'r').read
  erb = ERB.new(template_file)
  File.open("index.html", 'w+') { |file| file.write(erb.result(binding)) }
end

convert_erb_html_file
