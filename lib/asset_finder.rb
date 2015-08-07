require "asset_finder/version"
require "asset_finder/configuration"
require "asset_finder/finder"
require "asset_finder/javascript/normalizer"
require "asset_finder/javascript/finder"
require "asset_finder/stylesheet/normalizer"
require "asset_finder/stylesheet/finder"
require "asset_finder/railtie" if defined?(::Rails::Railtie)

module AssetFinder
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(self.configuration)
  end
end
