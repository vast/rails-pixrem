class CssController < ApplicationController
  def test
    render text: Rails.application.assets['rails.css']
  end
end
