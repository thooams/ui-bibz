require 'test_helper'
include UiBibz::Helpers
class NavTest < ActionView::TestCase

  test 'Nav with tab' do
    actual = UiBibz::Ui::Core::Nav.new().tap do |n|
      n.link 'Home', status: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile'
      n.link 'Messages', url: "#messages", selector: 'messages'
    end.render
    expected = "<ul class=\"nav\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#messages\">Messages</a></li></ul>"
    assert_equal expected, actual
  end

  test 'Nav with pills' do
    actual = UiBibz::Ui::Core::Nav.new(type: :pills, position: :justified).tap do |n|
      n.link 'Home', status: :active, url: "#Home", selector: 'home'
      n.link 'Profile', url: "#profile", selector: 'profile', badge: 16
      n.link 'Messages', url: "#messages", selector: 'messages', status: :disabled
    end.render
    expected = "<ul class=\"nav nav-pills pull-justified\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile<span class=\"badge\">16</span></a></li><li class=\"nav-item\"><a class=\"disabled nav-link\" href=\"#messages\">Messages</a></li></ul>"

    assert_equal expected, actual
  end

end
