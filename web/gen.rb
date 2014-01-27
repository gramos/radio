require 'erb'

def convert_erb_html_file
  files = Dir.glob("*.mp3")

  template_file = File.open("./templates/index.html.erb", 'r').read
  erb = ERB.new(template_file)
  File.open("index.html", 'w+') { |file| file.write(erb.result(binding)) }
end

convert_erb_html_file
