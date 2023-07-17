# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Numbers
  # Create a FormulaField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # *  - formula_field_name, String || Symbol (default: "#{content}_formula")
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new('value', { formula_field_name: :formula }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new do
  #     'value'
  #   end
  #
  # ==== Helper
  #
  #   formula_field(value, options = {}, html_options = {})
  #
  class FormulaField < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      formula_field_html_tag
    end

    private

    def formula_field_html_tag
      UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new(class: join_classes('formula_field', state, size)).tap do |sf|
        sf.addon @options[:append] unless @options[:append].nil?
        sf.text_field formula_field_name, nil, text_field_formula_html_options
        sf.addon '=', class: 'formula-field-sign'
        sf.text_field content, nil, text_field_input_html_options
        sf.addon formula_field_alert_glyph, { class: 'formula-field-alert' }, { data: { 'bs-toggle': 'tooltip' } }
        sf.addon @options[:prepend] unless @options[:prepend].nil?
      end.render
    end

    def text_field_formula_html_options
      opts = html_options.clone || {}
      opts[:value] = html_options.delete(:formula_field_value)
      opts
    end

    def text_field_input_html_options
      opts = html_options.clone || {}
      opts.merge({ readonly: true, class: 'formula-field-result' })
    end

    def component_html_classes
      super << %w[formula-field form-control]
    end

    def component_html_options
      disabled? ? { disabled: 'disabled' } : {}
    end

    def formula_field_alert_glyph
      UiBibz::Ui::Core::Icons::Glyph.new('exclamation-triangle', status: :danger).render
    end

    def formula_field_name
      options[:formula_field_name] || content_formula_name
    end

    def content_formula_name
      content.to_s.chars.count { |i| i == ']' }.positive? ? content.to_s.gsub(/]$/, '_formula]') : "#{content}_formula"
    end

    def state
      states_matching[@options[:status] || @options[:state]] if @options[:status] || @options[:state]
    end

    # :lg, :sm or :xs
    def size
      "input-group-#{options[:size]}" if options[:size]
    end

    def states_matching
      {
        success: 'is-valid',
        danger: 'is-invalid',
        valid: 'is-valid',
        invalid: 'is-invalid',
        active: 'active',
        disabled: 'disabled'
      }
    end
  end
end
