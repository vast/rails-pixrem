require_relative 'rails-pixrem/version'
require_relative 'rails-pixrem/processor'

module RailsPixrem
  autoload :Sprockets, 'rails-pixrem/sprockets'

  def self.install(assets)
    Sprockets.new(processor).install(assets)
  end

  def self.processor
    @processor ||= Processor.new
  end
end
