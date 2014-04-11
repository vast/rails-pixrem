begin
  require 'sprockets/railtie'

  module RailsPixrem
    class Railtie < ::Rails::Railtie
      initializer :setup_pixrem, group: :all do |app|
        RailsPixrem.install(app.assets)
      end
    end
  end
rescue LoadError
end
