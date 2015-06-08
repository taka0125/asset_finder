require 'spec_helper'

describe AssetFinder::Stylesheet::Normalizer do
  let(:root_dir) { '/data/rails/app/assets/stylesheets/' }

  describe '#norimalize' do
    subject { AssetFinder::Stylesheet::Normalizer.new(root_dir).norimalize(path) }

    context "extension is 'css'" do
      let(:path) { "#{root_dir}test/something.css" }
      it { is_expected.to eq 'test/something.css' }
    end

    context "extension is 'scss'" do
      let(:path) { "#{root_dir}test/something.scss" }
      it { is_expected.to eq 'test/something.css' }
    end

    context "extension is 'css.scss'" do
      let(:path) { "#{root_dir}test/something.css.scss" }
      it { is_expected.to eq 'test/something.css' }
    end
  end
end
