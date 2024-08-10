require_relative "lib/asset_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "asset_finder"
  spec.version       = AssetFinder::VERSION
  spec.authors       = ["Takahiro Ooishi"]
  spec.email         = ["taka0125@gmail.com"]

  spec.summary       = %q{Find javascripts and stylesheets for `rake asset:precompile`.}
  spec.description   = %q{Find javascripts and stylesheets. Configure precompile path.}
  spec.homepage      = "https://github.com/taka0125/asset_finder"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.files         = Dir['LICENSE', 'README.md', 'lib/**/*', 'exe/**/*', 'sig/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'railties', '>= 6.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'appraisal'
end
