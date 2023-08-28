require "asset_finder/version"
require "asset_finder/configuration"
require "asset_finder/sprockets_config_generator"
require "asset_finder/path_pattern"
require "asset_finder/path_pattern_collection"
require "asset_finder/javascript/sprockets_config_generator"
require "asset_finder/javascript/normalizer"
require "asset_finder/javascript/path_collector"
require "asset_finder/javascript/path_pattern_collection"
require "asset_finder/stylesheet/dartsass_config_generator"
require "asset_finder/stylesheet/sprockets_config_generator"
require "asset_finder/stylesheet/normalizer"
require "asset_finder/stylesheet/path_collector"
require "asset_finder/stylesheet/path_pattern_collection"
require "asset_finder/railtie" if defined?(::Rails::Railtie)

module AssetFinder
  class << self
    attr_accessor :config

    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end
end
