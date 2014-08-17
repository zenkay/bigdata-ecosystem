Big Data Ecosystem Dataset 
==========================

Incomplete-but-useful list of big-data related projects packed into a JSON dataset.

- Main table: http://bigdata.andreamostosi.name
- Raw JSON data: http://bigdata.andreamostosi.name/data.json
- Original page on my blog: http://blog.andreamostosi.name/big-data/

Related projects:
- [Hadoop Ecosystem Table](http://hadoopecosystemtable.github.io/) by [Javi Roman](https://github.com/javiroman)
- [Awesome Big Data](https://github.com/onurakpolat/awesome-bigdata) by [Onur Akpolat](https://github.com/onurakpolat)
- [Awesome Awesomeness](https://github.com/bayandin/awesome-awesomeness) by [Alexander Bayandin](https://github.com/bayandin)
- [Awesome Hadoop](https://github.com/youngwookim/awesome-hadoop) by [Youngwoo Kim](https://github.com/youngwookim)

## Categories

<% categories.each do |category| -%>
- [<%= category["name"] %>](#<%= category["name"].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') %>)
<% end %>

<% categories.each do |category| -%>

## <%= category["name"] %>

<% unless category["items"].nil? -%>
<%- category["items"].each do |item| -%>
<% if item["links"].any? -%>
* [<%= item["name"] %>](<%= item["links"][0]["url"] %>) - <%= item["abstract"] %>.
<% else -%>
* **<%= item["name"] %>** - <%= item["abstract"] %>
<% end -%>
<% end -%>
<% end -%>
<% end -%>

# Papers

<% papers.sort_by { |k, v| -(k.to_i) }.each do |year, papers_by_year| -%>
## <%= year %>
<%- papers_by_year.each do |paper| -%>
<% if paper["links"].any? -%>
* **<%= paper["year"] %>** - [<%= paper["title"] %>](<%= paper["links"][0]["url"] %>)
<% end -%>
<% end -%>
<% end -%>
