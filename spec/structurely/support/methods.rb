def load_json(name)
  JSON.parse(file_fixture(name))
end

def file_fixture(file_name)
  File.open("#{File.dirname(__FILE__)}/fixtures/#{file_name}.json").read
end
