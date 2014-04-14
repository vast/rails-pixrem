require_relative 'rails-pixrem/version'
require_relative 'rails-pixrem/processor'
require_relative 'rails-pixrem/railtie' if defined?(Rails)

module RailsPixrem
  autoload :Sprockets, 'rails-pixrem/sprockets'

  def self.install(assets, options = {})
    Sprockets.new(processor(options)).install(assets)
  end

  def self.processor(options = {})
    @cache ||= {}
    cache_key = options.to_s
    @cache[cache_key] ||= Processor.new(options)
  end
end
