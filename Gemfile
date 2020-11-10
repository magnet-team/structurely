source "https://rubygems.org"
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }
gemspec

group :development, :test do
  gem "pry"
  gem "dotenv"
end

group :development do
  gem "guard"
  gem "guard-rspec"
  gem "standard"
end

group :test do
  gem "rspec", "~> 3.0"
  gem "vcr", "~> 6.0"
  gem "vcr_better_binary", "~> 0.2.0"
  gem "webmock", "~> 3.9"
end
