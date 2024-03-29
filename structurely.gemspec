lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "structurely/version"

Gem::Specification.new do |spec|
  spec.name = "structurely"
  spec.version = Structurely::VERSION
  spec.authors = ["Conor Odell", "Andrew Mason"]
  spec.email = ["conorao@gmail.com", "andrewmcodes@protonmail.com"]

  spec.summary = "Client for accessing Structurely's API"
  spec.homepage = "https://github.com/magnet-team/structurely"
  spec.license = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "api_struct", "~> 1.0"
  spec.add_dependency "dry-configurable", "~> 0.11"

  spec.add_development_dependency "bundler", ">= 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.9"
  spec.add_development_dependency "vcr", "~> 6.0"
end
