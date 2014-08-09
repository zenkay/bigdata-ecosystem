require 'erb'
require 'json'
require "maruku"
require "pp"

puts "Run: #{__FILE__}"

projects = []

# iterate on data files (alphabetically ordered)
Dir.glob("#{File.dirname(__FILE__)}/../projects-data/*.json").sort.each do |file|

  # read content
  data = JSON.parse(File.read(file))
  projects << data

end

puts "Data succesfully loaded."

# write result
File.open("#{File.dirname(__FILE__)}/../public/bigdataecosystemraw.json", 'w') { |file| file.write(projects.to_json) } 

puts "Destination file written."