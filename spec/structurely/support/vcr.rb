require "vcr"
require "vcr_better_binary"

VCR.configure do |vcr|
  vcr.allow_http_connections_when_no_cassette = ENV.fetch("REBUILD_CASSETTES", false)
  vcr.before_record do |c|
    c.request.headers = nil
  end
  vcr.cassette_library_dir = "spec/support/vcr_cassettes"
  vcr.cassette_serializers[:better_binary] = VcrBetterBinary::Serializer.new
  vcr.configure_rspec_metadata!
  vcr.debug_logger = File.open("tmp/vcr.log", "w")
  vcr.default_cassette_options = {
    allow_playback_repeats: false,
    match_requests_on: %i[uri method],
    record: ENV.fetch("VCR", :new_episodes).to_sym,
    serialize_with: :better_binary
  }
  vcr.hook_into :webmock
  vcr.ignore_localhost = false
  vcr.register_request_matcher :forecast do |request_1, request_2|
    def stripper(path)
      path.gsub(/,[^,]+$/, "")
    end
    stripper(URI(request_1.uri).path) == stripper(URI(request_2.uri).path)
  end
end
