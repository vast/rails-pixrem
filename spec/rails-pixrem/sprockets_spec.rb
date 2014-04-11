require 'spec_helper'

describe 'Sprockets integration' do
  let(:assets) { Sprockets::Environment.new }

  before do
    assets.append_path(Pathname(__FILE__).dirname.join('../dummy/app/assets/stylesheets'))
    RailsPixrem.install(assets)
  end

  it 'works with Sprockets' do
    assets['test.css'].to_s.should == "i {\n" +
                                      "  padding: 16px;\n" +
                                      "  padding: 1rem\n" +
                                      "}\n"
  end
end
