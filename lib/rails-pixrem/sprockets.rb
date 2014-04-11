module RailsPixrem
  class Sprockets
    def initialize(processor)
      @processor = processor
    end

    def process(context, css)
      @processor.process(css)
    end

    def process_only_css(context, content)
      process(context, content)
    rescue ExecJS::ProgramError => e
      if e.message =~ /Can't parse CSS/
        content
      else
        raise e
      end
    end

    def install(assets)
      if ignore_syntax_error?
        register(assets) { |context, css| process_only_css(context, css) }
      else
        register(assets) { |context, css| process(context, css) }
      end
    end

    private

    def register(assets, &block)
      assets.register_postprocessor('text/css', :pixrem, &block)
    end

    # Return true if broken sass-rails is loaded
    def ignore_syntax_error?
      return false unless defined? Sass::Rails

      fixed   = Gem::Version.new('4.0.1')
      current = Gem::Version.new(Sass::Rails::VERSION)

      current < fixed
    end
  end
end
