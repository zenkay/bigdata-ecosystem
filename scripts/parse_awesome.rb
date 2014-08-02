require "json"

current = {}

Dir.glob("../projects-data/*.json").each do |file|
  data = JSON.parse(File.read(file))
  current[data["name"]] = file
end

category = ""

File.readlines('awesome-list.md').each do |line|
  if line.match(/\#\# ([^\n]+)/)
    category = line.scan(/\#\# ([^\n]+)/)[0][0]
    puts category.inspect
  end

  if line.match(/\* \[([^\]]+)\]\(([^\)]+)\) \- ([^\n]+)/)
    l = line.match(/\* \[([^\]]+)\]\(([^\)]+)\) \- ([^\n]+)/)
    if current[l[1]].nil?
      puts "New: #{l[1]}"
      data = {}
      data["name"] = l[1]
      data["description"] = l[3]
      data["abstract"] = l[3]
      data["category"] = category
      data["tags"] = []
      filename = "#{data["name"].downcase.gsub(/[^a-z0-9]/, "_")}.json"
      data["links"] = [{"text" => "Website", "url" => l[2]}]
      File.open("./data/#{filename}", 'w') { |file| file.write(JSON.pretty_generate(data)) }
    else
      data = JSON.parse(File.read(current[l[1]]))
      is_link_new = true
      data["links"].each {|item| is_link_new = false if item["url"] == l[2]}
      if is_link_new
        puts "Updated: #{l[1]}"
        data["links"] ||= []
        data["links"] << {"text" => "Website", "url" => l[2]}
        filename = "#{data["name"].downcase.gsub(/[^a-z0-9]/, "_")}.json"
        File.open("./data/#{filename}", 'w') { |file| file.write(JSON.pretty_generate(data)) }
      end
    end
  end
end