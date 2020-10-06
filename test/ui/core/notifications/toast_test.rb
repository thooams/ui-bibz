# frozen_string_literal: true

require 'test_helper'
class ToastTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'toast' do
    actual = ui_toast(auto_hide: true, class: 'my-toast') do |t|
      t.header 'My header toast', glyph: 'eye', time: 'Now', class: 'my-header-toast'
      t.body 'My body toast', class: 'my-body-toast'
    end
    expected = "<div data-autohide=\"true\" class=\"my-toast toast\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\"><div class=\"my-header-toast toast-header\"><i class=\"mr-2 glyph fas fa-eye\"></i><strong class=\"mr-auto\">My header toast</strong><small class=\"text-muted\">Now</small><button class=\"ml-2 mb-1 close\" data-dismiss=\"toast\" aria-label=\"Close\"></button></div><div class=\"my-body-toast toast-body\">My body toast</div></div>"

    assert_equal expected, actual
  end
end
