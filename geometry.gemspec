require_relative 'lib/geometry/version'

Gem::Specification.new do |spec|
  spec.name          = "geometry"
  spec.version       = Geometry::VERSION
  spec.authors       = ["petervandeput"]
  spec.email         = ["vandeputp@gmail.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com"

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] ="http://mygemserver.com"
  spec.metadata["changelog_uri"] = "http://mygemserver.com"


  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", ">= 5.8"
  spec.add_development_dependency "minitest-reporters", ">= 1.1"
end
