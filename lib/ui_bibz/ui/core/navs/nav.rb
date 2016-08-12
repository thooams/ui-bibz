require 'ui_bibz/ui/core/navs/components/nav_link'
require 'ui_bibz/ui/core/navs/components/nav_dropdown'
module UiBibz::Ui::Core::Navs

  # Create a nav
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
  # * +type+ - Symbol
  #   (+:pills+, +:tab+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navs::Nav.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navs::Nav.new(options = nil, html_options = nil).tap do |n|
  #     ...
  #     n.link content = nil, options = nil, html_options = nil, block
  #     n.link content = nil, options = nil, html_options = nil, block
  #     n.dropdown content = nil, options = nil, html_options = nil, block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navs::Nav.new(type: :pills).tap do |n|
  #     n.link 'Test', url: '#test'
  #     n.link 'Test2', url: '#test2', state: :active
  #     n.dropdown('Action') do |d|
  #       d.list content = nil, options = nil, html_options = nil, &block
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   nav(options = { tap: true }, html_options = {}) do |n|
  #     n.link(content, options = {}, html_options = {})
  #     n.link(options = {}, html_options = {}) do
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
  class Nav < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag tag, @items.join.html_safe, html_options
    end

    # Add nav link items
    # See UiBibz::Ui::Core::Navs::NavLink
    def link content = nil, options = {}, html_options = nil, &block
      block_given? ? content.merge!({ nav_type: type }) : options.merge!({ nav_type: type })
      @items << NavLink.new(content, options, html_options, &block).render
    end

    # Add nav in nav
    def nav content = nil, options = {}, html_options = nil, &block
      @items << content_tag(:li, Nav.new(content, options, html_options).tap(&block).render, class: 'nav-item')
    end

    # Add nav dropdown items
    # See UiBibz::Ui::Core::Navs::NavDropdown
    def dropdown content = nil, options = {}, html_options = nil, &block
      @items << NavDropdown.new(content, options, html_options).tap(&block).render
    end

  private

    def component_html_classes
      ["nav", type, position, stacked]
    end

    # tabs or pills
    def type
      "nav-#{ @options[:type] }" unless @options[:type].nil?
    end

    def position
      "pull-#{ @options[:position] }" unless @options[:position].nil?
    end

    def stacked
      "nav-stacked" unless @options[:stacked].nil?
    end

    def tag
      type == "nav-links" ? :nav : :ul
    end

  end
end