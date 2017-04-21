require 'ui_bibz/ui/core/forms/surrounds/components/surround_addon'
require 'ui_bibz/ui/core/forms/surrounds/components/surround_button'
require 'ui_bibz/ui/core/forms/surrounds/components/surround_button_group'
require 'ui_bibz/ui/core/forms/surrounds/components/surround_button_link'
require 'ui_bibz/ui/core/forms/surrounds/components/surround_checkbox_field'
require 'ui_bibz/ui/core/forms/surrounds/components/surround_radio_field'
require 'ui_bibz/ui/core/forms/surrounds/components/surround_dropdown'
module UiBibz::Ui::Core::Forms::Surrounds

  # Create a TextField
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
  # * +prepend+ - String, Html
  # * +append+ - String, Html
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::Forms::Texts::TextField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   text_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SurroundField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :div, @items.join.html_safe, html_options
    end

    def dropdown content, options = nil, html_options = nil, &block
      @items << SurroundDropdown.new(content, options, html_options).tap(&block).render
    end

    def input
    end

    def glyph content = nil, options = {}, html_options = nil, &block
      @items << SurroundAddon.new(UiBibz::Ui::Core::Glyph.new(content, options, html_options, &block).render).render
    end

    def addon content
      @items << SurroundAddon.new(content).render
    end

    def button content = nil, options = nil, html_options = nil, &block
      @items << SurroundButton.new(content, options, html_options, &block).render
    end

    def button_group content = nil, options = nil, html_options = nil, &block
      @items << SurroundButtonGroup.new(content, options, html_options, &block).render
    end

    def button_link content = nil, options = nil, html_options = nil, &block
      @items << SurroundButtonLink.new(content, options, html_options, &block).render
    end

    def checkbox_field content = nil, options = nil, html_options = nil, &block
      @items << SurroundCheckboxField.new(content, options, html_options, &block).render
    end

    def radio_field content = nil, options = nil, html_options = nil, &block
      @items << SurroundRadioField.new(content, options, html_options, &block).render
    end

    private

    def component_html_classes
      ['input-group', status, size]
    end

    # :lg, :sm or :xs
    def size
      "input-group-#{ options[:size] }" if options[:size]
    end

    def status
      "has-#{ options[:status] }" if options[:status]
    end

  end
end