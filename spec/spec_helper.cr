require "spec"
require "./support/*"
require "webmock"
require "../src/google_maps_api"

def load_fixture(fixture : String)
  contents = File.read(fixture)
  JSON.parse(contents)
end
