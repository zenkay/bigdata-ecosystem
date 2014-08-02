# Awesome Big Data

A curated list of awesome big data frameworks, ressources and other awesomeness. Inspired by [awesome-php](https://github.com/ziadoz/awesome-php), [awesome-python](https://github.com/vinta/awesome-python), [awesome-ruby](https://github.com/Sdogruyol/awesome-ruby), [hadoopecosystemtable](http://hadoopecosystemtable.github.io/) & [big-data](http://blog.andreamostosi.name/big-data/).

Your contributions are always welcome!

- [Awesome Big Data](#awesome-bigdata)
<% categories.each do |category| -%>
    - [<%= category["name"] %>](#<%= category["name"].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') %>)
<% end %>
- [Other Awesome Lists](#other-awesome-lists)

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
