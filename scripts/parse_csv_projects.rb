require "csv"
require "json"

CSV.foreach("./projects.csv", col_sep: ";", encoding: "iso-8859-1:UTF-8") do |row|
  puts row[0]
  data = {}
  data["name"] = row[0]
  data["description"] = row[3]
  data["abstract"] = row[3]
  data["category"] = row[2]
  data["tags"] = []
  filename = "#{data["name"].downcase.gsub(/[^a-z0-9]/, "_")}.json"
  data["links"] = []
  data["links"] << {"text" => "Website", "url" => row[1]} unless row[1].nil?
  # data["links"] << {"text" => "Website", "url" => row[4]} unless row[4].nil?
  # data["links"] << {"text" => "Website", "url" => row[5]} unless row[5].nil?
  # data["links"] << {"text" => "Website", "url" => row[6]} unless row[6].nil?
  File.open("./data/#{filename}", 'w') { |file| file.write(JSON.pretty_generate(data)) }
end