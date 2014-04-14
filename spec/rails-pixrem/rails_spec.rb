require 'spec_helper'

describe CssController, type: :controller do
  subject { response }

  before do
    cache = Rails.root.join('tmp/cache')
    cache.rmtree if cache.exist?

    get :test
  end

  it { should be_success }
  its(:body) { should include('margin: 3rem;') }
  its(:body) { should include('margin: 60px;') }
end
