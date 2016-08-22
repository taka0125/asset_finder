# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asset_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "asset_finder"
  spec.version       = AssetFinder::VERSION
  spec.authors       = ["Takahiro Ooishi"]
  spec.email         = ["taka0125@gmail.com"]

  spec.summary       = %q{Find javascripts and stylesheets for `rake asset:precompile`.}
  spec.description   = %q{Find javascripts and stylesheets. Configure precompile path.}
  spec.homepage      = "https://github.com/taka0125/asset_finder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'railties', '>= 3.1', '< 6.0'
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
