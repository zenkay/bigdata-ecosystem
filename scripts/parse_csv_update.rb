# require "csv"

# CSV.foreach("./update.csv") do |row|
#   data = {}
#   data["name"] = row[0]
#   data["description"] = row[1]
#   data["abstract"] = row[1]
#   data["category"] = row[2]
#   data["tags"] = []
#   filename = "#{data["name"].downcase.gsub(/[^a-z0-9]/, "_")}.json"
#   data["links"] = []
#   data["links"] << {"text" => "Website", "url" => row[3]} if row[3].present?
#   data["links"] << {"text" => "Website", "url" => row[4]} if row[4].present?
#   data["links"] << {"text" => "Website", "url" => row[5]} if row[5].present?
#   data["links"] << {"text" => "Website", "url" => row[6]} if row[6].present?

#   File.open("./data/#{filename}", 'w') { |file| file.write(JSON.pretty_generate(data)) }
# end