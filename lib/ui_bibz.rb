require 'action_view'
#require 'haml/helpers'
require 'will_paginate'

module UiBibz

  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  # Maybe remove ?
  def self.setup
    yield self
  end

  module Ui
    autoload :Component, "ui_bibz/ui/component"
    autoload :Ui, "ui_bibz/ui/ui"
    autoload :Nav, "ui_bibz/ui/nav"
    autoload :ListGroup, "ui_bibz/ui/list_group"
    autoload :List, "ui_bibz/ui/list"
    autoload :Panel, "ui_bibz/ui/panel"
    autoload :Tab, "ui_bibz/ui/tab"
    autoload :Grid, "ui_bibz/ui/grid"
    autoload :LinkAction, "ui_bibz/ui/grid/components/link_action"
    autoload :Dropdown, "ui_bibz/ui/dropdown"
    autoload :DropdownButton, "ui_bibz/ui/dropdown_button"
    autoload :LinkButton, "ui_bibz/ui/link_button"
    autoload :Glyph, "ui_bibz/ui/glyph"
    autoload :Breadcrumb, "ui_bibz/ui/breadcrumb"
  end

  module Helpers
    autoload :UiHelper,   "ui_bibz/helpers/ui_helper"
    autoload :MetaHelper, "ui_bibz/helpers/meta_helper"
  end

  module Concerns
    module Models
      autoload :Searchable, "ui_bibz/concerns/models/searchable"
    end
  end

end


require "ui_bibz/rails/engine"
