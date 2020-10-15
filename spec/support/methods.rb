def load_json(name)
  file_path = File.join(File.dirname(__FILE__), "fixtures/#{name}.json")
  JSON.parse(File.read(file_path))
end
