require 'erb'
require 'json'
require "maruku"
require "pp"

puts "Run: #{__FILE__}"

# load ordered category list
table_config = JSON.parse(File.read("#{File.dirname(__FILE__)}/../config/categories.json"))

data_grouped_by_category = {}

puts "Config succesfully loaded."

# iterate on data files (alphabetically ordered)
Dir.glob("#{File.dirname(__FILE__)}/../projects-data/*.json").sort.each do |file|

	# read content
  data = JSON.parse(File.read(file))
  data_grouped_by_category[data["category"]] ||= []

  # convert markdown to HTML
  data["description"] = Maruku.new(data["description"]).to_html
  data["abstract"] = Maruku.new(data["abstract"]).to_html

  data_grouped_by_category[data["category"]] << data
end

puts "Data succesfully loaded."

# create table content
categories = []
table_config["categories"].each do |c|
	categories << {"name" => c, "items" => data_grouped_by_category[c]}
end

puts "Data succesfully grouped."

# write result
File.open("#{File.dirname(__FILE__)}/../public/hadoopecosystemtable.html", 'w') { |file| file.write(ERB.new(File.read("#{File.dirname(__FILE__)}/templates/hadoopecosystemtable.html")).result(binding)) } 

puts "Destination file written."