require 'spec_helper'

describe AssetFinder::Javascript::Normalizer do
  let(:root_dir) { '/data/rails/app/assets/javascripts/' }

  describe '#normalize' do
    let(:patterns) { [] }
    subject { AssetFinder::Javascript::Normalizer.new(root_dir, patterns).normalize(path) }

    context "extension is 'js'" do
      let(:path) { "#{root_dir}test/something.js" }
      it { is_expected.to eq 'test/something.js' }
    end

    context "extension is 'js.coffee'" do
      let(:path) { "#{root_dir}test/something.js.coffee" }
      it { is_expected.to eq 'test/something.js' }
    end

    context "extension is 'coffee'" do
      let(:path) { "#{root_dir}test/something.coffee" }
      it { is_expected.to eq 'test/something.js' }
    end

    context "extension is not javascripts" do
      let(:path) { "#{root_dir}test/something.txt" }
      it { is_expected.to be_nil }
    end

    context "add pattern" do
      let(:patterns) { [/^(.*)\.js\.jsx\.coffee$/] }
      let(:path) { "#{root_dir}test/something.js.jsx.coffee" }
      it { is_expected.to eq 'test/something.js' }
    end
  end
end
