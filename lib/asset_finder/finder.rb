module AssetFinder
  class Finder
    def self.execute
      Javascript::Finder.execute + Stylesheet::Finder.execute
    end
  end
end
