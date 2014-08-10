require "csv"
require "json"

CSV.foreach("./papers.csv", col_sep: ";", encoding: "iso-8859-1:UTF-8") do |row|
  puts row[1]
  data = {}
  data["title"] = row[1]
  data["year"] = row[0]
  data["authors"] = ""
  data["abstract"] = ""
  data["tags"] = []
  filename = "#{data["year"]}-#{(data["title"]).downcase.gsub(/[^a-z0-9]/, "_")}.json"
  data["links"] = []
  data["links"] << {"text" => "PDF Paper", "url" => row[2]} unless row[2].nil?
  File.open("./data/#{filename}", 'w') { |file| file.write(JSON.pretty_generate(data)) }
end