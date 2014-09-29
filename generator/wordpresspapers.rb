require 'erb'
require 'json'
require "maruku"
require "pp"

puts "Run: #{__FILE__}"

# load ordered category list
table_config = JSON.parse(File.read("#{File.dirname(__FILE__)}/../config/categories.json"))

data_grouped_by_category = {}

puts "Config succesfully loaded."

papers = {}

Dir.glob("#{File.dirname(__FILE__)}/../papers-data/*.json").sort.each do |file|
  # read content
  data = JSON.parse(File.read(file))
  papers[data["year"]] ||= []
  papers[data["year"]] << data
end

puts "Paper Data succesfully loaded."

# write result
File.open("#{File.dirname(__FILE__)}/../public/wordpresspapers.html", 'w') { |file| file.write(ERB.new(File.read("#{File.dirname(__FILE__)}/templates/wordpresspapers.html")).result(binding)) } 

puts "Destination file written."