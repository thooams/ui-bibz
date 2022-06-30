# frozen_string_literal: true

module UiBibz::Utils
  # Generate the col class name
  class BreakdownClassNameGenerator
    POSITIONING = %i[num offset push pull order].freeze
    BREAKPOINTS = UiBibz::Ui::Core::Component::BREAKPOINTS
    PARAMETERS =  BREAKPOINTS + POSITIONING + [:position]

    def initialize(options = {}, klass_name = 'col')
      @options = options.is_a?(Integer) ? { num: options } : options
      @klass_name = klass_name
    end

    # Possible options
    # 3 or md: 3 or md: { num: 3 }, xs: { num: 4 }
    def class_names
      return @klass_name unless col_options?

      kl = []
      @options.each do |key, value|
        kl << write_classes(key.to_sym, value) if BREAKPOINTS.include?(key.to_sym)
      end
      kl << write_classes(nil, @options)

      kl.compact_blank!
    end

    private

    def col_options?
      (@options.keys.map(&:to_sym) & PARAMETERS).present?
    end

    # md: 8 or md: { num: 3}, xs: { num: 4 }
    def write_classes(size, opts)
      if opts.is_a?(Hash)
        @position = opts[:position]

        opts.filter_map do |k, v|
          send(k, size, v) if POSITIONING.include?(k.to_sym)
        end.join(' ')
      else
        send(:num, size, opts)
      end
    end

    # col-md-9
    def num(size, number, _pos = nil)
      size == :auto ? @klass_name : ["#{@klass_name}#{position}", size, number].compact.join('-')
    end

    # col-md-offset-9
    def offset(size, number)
      ['offset', size, number].compact.join('-')
    end

    # col-md-push-9
    def push(size, number)
      [@klass_name, size, 'push', number].compact.join('-')
    end

    # order-md-9
    def order(size, number)
      ['order', size, number].compact.join('-')
    end

    # col-md-pull-9
    def pull(size, number)
      [@klass_name, size, 'pull', number].compact.join('-')
    end

    def position
      case @position || @options[:position]
      when :vertical
        'y'
      when :horizontal
        'x'
      end
    end
  end
end
