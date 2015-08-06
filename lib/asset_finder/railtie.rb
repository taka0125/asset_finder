module AssetFinder
  class Railtie < ::Rails::Railtie
    config.asset_finder = ActiveSupport::OrderedOptions.new
    config.asset_finder.javascript_patterns = []
    config.asset_finder.stylesheet_patterns = []

    config.to_prepare do
      AssetFinder.configure do |config|
        config.javascript_patterns = Rails.application.config.asset_finder.javascript_patterns
        config.stylesheet_patterns = Rails.application.config.asset_finder.stylesheet_patterns
      end

      Rails.application.config.assets.precompile += AssetFinder::Finder.execute
    end
  end
end
