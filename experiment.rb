require 'net/http'
require 'uri'

target_uri = "https://83959d3f65c3406b9dced1aae389cd09.vfs.cloud9.us-east-2.amazonaws.com/follow"
uri = URI.parse(target_uri)

req = Net::HTTP::Post.new(uri)
##req.set_form_data({'sample_data' => 'hogehogehoge', 'time_data' => '2011-11-11'})

req_options = {
 use_ssl: uri.scheme = "https" 
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
	http.request(req)
end

puts response
