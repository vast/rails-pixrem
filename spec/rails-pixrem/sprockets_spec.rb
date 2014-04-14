require 'spec_helper'

describe 'Sprockets integration' do
  let(:assets) { Sprockets::Environment.new }

  before do
    assets.append_path(Pathname(__FILE__).dirname.join('../dummy/app/assets/stylesheets'))
  end

  context 'with default configuration' do
    before { RailsPixrem.install(assets) }

    it 'works with Sprockets' do
      assets['test.css'].to_s.should == "i {\n" +
                                        "  padding: 16px;\n" +
                                        "  padding: 1rem\n" +
                                        "}\n"
    end
  end

  context 'when additional configuration passed' do
    before { RailsPixrem.install(assets, root_value: '40px') }

    it 'honors root value' do
      assets['test.css'].to_s.should == "i {\n" +
                                        "  padding: 40px;\n" +
                                        "  padding: 1rem\n" +
                                        "}\n"
    end
  end
end
