require 'test_helper'
include UiBibz::Helpers
class NavTest < ActionView::TestCase

  test 'breadcrumb' do
    actual = UiBibz::Ui::Core::Breadcrumb.new.tap do |b|
      b.link 'Home', url: '#home', glyph: 'home'
      b.link 'Toto', { url: '#toto', status: :active }
    end.render
    expected = "<ol class=\"breadcrumb\"><li><a href=\"#home\"><i class=\"glyph fa fa-home\"></i> Home</a></li><li class=\"active\"><a href=\"#toto\">Toto</a></li></ol>"

    assert_equal expected, actual
  end

  test 'breadcrumb with store' do
    users    = create_list(:user, 3)
    actual   = UiBibz::Ui::Core::Breadcrumb.new(store: users, link_label: :name_fr, link_url: user_path(:id)).render
    expected = "<ol class=\"breadcrumb\"><li><a href=\"/users/1/\">Name fr</a></li><li><a href=\"/users/2/\">Name fr</a></li><li>Name fr</li></ol>"

    assert_equal expected, actual
  end


end
