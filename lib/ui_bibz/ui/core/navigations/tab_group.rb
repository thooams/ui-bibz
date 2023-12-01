# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations
  # Create a tab_group
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
  # * +position+ - Symbol
  #   (+:left+, +:right+, +:center+)
  # * +tag_type+ - Symbol
  #   (+:a+, +:span)
  # * +justify+ - Boolean
  # * +fill+ - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::TabGroup.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navigations::TabGroup.new(options = nil, html_options = nil).tap do |n|
  #     ...
  #     n.tab content = nil, options = nil, html_options = nil, block
  #     n.tab content = nil, options = nil, html_options = nil, block
  #     n.dropdown content = nil, options = nil, html_options = nil, block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::TabGroup.new(tag_type: :span).tap do |n|
  #     n.tab 'Test', url: '#test'
  #     n.tab 'Test2', url: '#test2', state: :active
  #     n.dropdown('Action') do |d|
  #       d.list content = nil, options = nil, html_options = nil, &block
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   ui_tab_group(options = {}, html_options = {}) do |n|
  #     n.tab(content, options = {}, html_options = {})
  #     n.tab(options = {}, html_options = {}) do
  #       content
  #     end
  #     n.dropdown(name, options = {}, html_options = {}) do |d|
  #       d.list(content, options = {}, html_options = {})
  #       d.list(options = {}, html_options = {}) do
  #         content
  #       end
  #     end
  #   end
  #
  class TabGroup < UiBibz::Ui::Core::Navigations::Nav
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize

    # Add nav link items
    # See UiBibz::Ui::Core::Navigations::NavLink
    def tab(content = nil, options = {}, html_options = nil, &block)
      if block
        content[:nav_type] = type
        content[:tag_type] = @options[:tag_type]
      else
        options[:nav_type] = type
        options[:tag_type] = @options[:tag_type]
      end
      @items << NavLink.new(content, options, html_options, &block)
    end

    private

    def component_html_classes
      ['nav', 'nav-tabs', position, justify, fill]
    end

    def component_html_options
      { role: 'tablist' }
    end

    def type
      @options[:nav_type] || 'nav-tabs'
    end
  end
end
