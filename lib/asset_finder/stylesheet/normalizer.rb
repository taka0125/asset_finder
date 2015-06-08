module AssetFinder
  module Stylesheet
    class Normalizer
      def initialize(root_dir)
        @root_dir = root_dir.to_s
      end

      def norimalize(path)
        if path.match(/^(.*)\.css\.scss$/)
          return $1.sub(@root_dir, '') + '.css'
        end

        if path.match(/^(.*)\.css$/)
          return $1.sub(@root_dir, '') + '.css'
        end

        if path.match(/^(.*)\.scss$/)
          return $1.sub(@root_dir, '') + '.css'
        end
      end
    end
  end
end
