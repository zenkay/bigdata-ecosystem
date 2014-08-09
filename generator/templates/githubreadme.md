Big Data Ecosystem Dataset 
==========================

Incomplete-but-useful list of big-data related projects.

- Main table: http://bigdata.andreamostosi.name
- Raw JSON data: http://bigdata.andreamostosi.name/data.json
- Original page on my blog: http://blog.andreamostosi.name/big-data/

Related projects:
- [Hadoop Ecosystem Table](http://hadoopecosystemtable.github.io/)
- [Awesome Big Data](https://github.com/onurakpolat/awesome-bigdata)

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
