require "asset_finder/version"
require "asset_finder/finder"
require "asset_finder/javascript/normalizer"
require "asset_finder/javascript/finder"
require "asset_finder/stylesheet/normalizer"
require "asset_finder/stylesheet/finder"
require "asset_finder/railtie" if defined?(::Rails::Railtie)

module AssetFinder
  # Your code goes here...
end
