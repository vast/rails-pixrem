begin
  require 'sprockets/railtie'

  module RailsPixrem
    class Railtie < ::Rails::Railtie
      initializer :setup_pixrem, group: :all do |app|
        RailsPixrem.install(app.assets, configuration(app))
      end

      def configuration(app)
        file = app.root.join('config/pixrem.yml')
        file.exist? ? YAML.load_file(file).symbolize_keys : {}
      end
    end
  end
rescue LoadError
end
