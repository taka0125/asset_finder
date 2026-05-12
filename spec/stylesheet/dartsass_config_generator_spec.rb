require 'fileutils'
require 'tmpdir'

describe AssetFinder::Stylesheet::DartsassConfigGenerator do
  let(:root_dir) { Dir.mktmpdir + '/' }

  after { FileUtils.remove_entry(root_dir) }

  describe '#execute' do
    subject { AssetFinder::Stylesheet::DartsassConfigGenerator.new(root_dir: root_dir).execute }

    context 'normal scss file' do
      before { FileUtils.touch(File.join(root_dir, 'application.scss')) }

      it 'includes the file' do
        expect(subject).to have_key('application.scss')
      end
    end

    context 'file starting with _' do
      before { FileUtils.touch(File.join(root_dir, '_partial.scss')) }

      it 'excludes the file' do
        expect(subject).not_to have_key('_partial.scss')
      end
    end

    context 'file in subdirectory starting with _' do
      before do
        FileUtils.mkdir_p(File.join(root_dir, 'sub'))
        FileUtils.touch(File.join(root_dir, 'sub', '_partial.scss'))
      end

      it 'excludes the file' do
        expect(subject).not_to have_key('sub/_partial.scss')
      end
    end

    context 'mixed files' do
      before do
        FileUtils.touch(File.join(root_dir, 'application.scss'))
        FileUtils.touch(File.join(root_dir, '_variables.scss'))
        FileUtils.touch(File.join(root_dir, 'layout.css'))
      end

      it 'includes non-underscore files' do
        expect(subject).to have_key('application.scss')
        expect(subject).to have_key('layout.css')
      end

      it 'excludes underscore files' do
        expect(subject).not_to have_key('_variables.scss')
      end
    end
  end
end
