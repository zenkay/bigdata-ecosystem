Big Data Ecosystem Dataset 
==========================

Incomplete-but-useful list of big-data related projects packed into a JSON dataset. 

**External references**: [Main page](http://bigdata.andreamostosi.name), [Raw JSON data of projects](http://bigdata.andreamostosi.name/data.json), [Original page on my blog](http://blog.andreamostosi.name/big-data/)

**Related projects**: [Hadoop Ecosystem Table](http://hadoopecosystemtable.github.io/) by [Javi Roman](https://github.com/javiroman), [Awesome Big Data](https://github.com/onurakpolat/awesome-bigdata) by [Onur Akpolat](https://github.com/onurakpolat), [Awesome Awesomeness](https://github.com/bayandin/awesome-awesomeness) by [Alexander Bayandin](https://github.com/bayandin), [Awesome Hadoop](https://github.com/youngwookim/awesome-hadoop) by [Youngwoo Kim](https://github.com/youngwookim), [Queues.io](https://github.com/strzalek/queues.io) by [Łukasz Strzałkowski](https://github.com/strzalek)

## How to contribute 

### Projects

Add a new JSON file to ```projects-data``` directory. Here is an [example](projects-data/apache_hadoop.json):

```
{
  "name": "Apache Hadoop",
  "description": "framework for distributed processing. Integrates MapReduce (parallel processing), YARN (job scheduling) and HDFS (distributed file system)",
  "abstract": "framework for distributed processing. Integrates MapReduce (parallel processing), YARN (job scheduling) and HDFS (distributed file system)",
  "category": "Frameworks",
  "tags": ["framework", "yahoo", "apache"],
  "links": [{"text": "Apache Hadoop", "url": "http://hadoop.apache.org/"}]
}
```

### Papers

Add a new JSON file to ```papers-data``` directory. Here is an [example](papers-data/2003-the_google_file_system.json):

```
{
  "title": "The Google File System",
  "year": "2003",
  "authors": "",
  "abstract": "",
  "tags": ["google"],
  "links": [{"text": "PDF Paper", "url": "http://static.googleusercontent.com/media/research.google.com/en//archive/gfs-sosp2003.pdf"}]
}
```

Data 
==========================

## Projects

<% categories.each do |category| -%>
- [<%= category["name"] %>](#<%= category["name"].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') %>)
<% end %>

<% categories.each do |category| -%>

### <%= category["name"] %>

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

## Papers

<% Time.now.year.downto(1997).each do |year| -%>
- [Published in <%= year %>](#<%= year %>)
<% end %>

<% papers.reverse_each do |year, papers_by_year| -%>

### <%= year %>

<%- papers_by_year.each do |paper| -%>
<% if paper["links"].any? -%>
* **<%= paper["year"] %>** - [<%= paper["title"] %>](<%= paper["links"][0]["url"] %>)
<% end -%>
<% end -%>
<% end -%>
