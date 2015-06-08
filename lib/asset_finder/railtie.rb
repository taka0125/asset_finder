module AssetFinder
  class Railtie < ::Rails::Railtie
    initializer 'Initialize asset_finder' do
      Rails.application.config.assets.precompile += AssetFinder::Finder.execute
    end
  end
end
