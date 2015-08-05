require "sinatra"
require "net/http"
require "uri"
require "JSON"

def get_results
  JSON.parse(Net::HTTP.get(URI.parse("http://www.amtrakconnect.com/nomadtojson.php")))
end

get "/" do
  @results = get_results
  erb :dashboard
end

get "/results" do
  get_results.to_json
end