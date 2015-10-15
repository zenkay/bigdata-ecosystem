require "faraday"

conn = Faraday.new(:url => 'https://api.parse.com') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

Dir.glob("../projects-data/*.json").each do |file|

	result = conn.post do |req|
	  req.url '/1/classes/Project'
	  req.headers['Content-Type'] = 'application/json'
	  req.headers['X-Parse-Application-Id'] = 'TVuKaXUvwcG0XdsLYREJ71uFKXCnXu4RIiSWk5lA'
	  req.headers['X-Parse-REST-API-Key'] = '4hIEiZqHR0R9HT4wYZwyYAjow9ydUbB3p38XHEJm'
	  req.body = IO.read(file)
	end

	puts result.inspect

end