# frozen_string_literal: true

require 'test_helper'

class ButtonTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'button' do
    actual   = ui_button('state')
    expected = '<button class="btn-secondary btn">state</button>'

    assert_equal expected, actual
  end

  test 'button with status' do
    actual   = ui_button('state', status: :success)
    expected = '<button class="btn-success btn">state</button>'

    assert_equal expected, actual
  end

  test 'button outline' do
    actual   = ui_button('state', status: :success, outline: true)
    expected = '<button class="btn-outline-success btn">state</button>'

    assert_equal expected, actual
  end

  test 'button disabled' do
    actual   = ui_button('state', state: :disabled)
    expected = '<button class="disabled btn-secondary btn" disabled="disabled">state</button>'

    assert_equal expected, actual
  end

  test 'button active' do
    actual   = ui_button('state', state: :active)
    expected = '<button class="active btn-secondary btn" aria-pressed="true">state</button>'

    assert_equal expected, actual
  end

  test 'button badge' do
    actual   = ui_button('state', badge: 2)
    expected = '<button class="btn-secondary btn">state<span class="bg-secondary badge">2</span></button>'

    assert_equal expected, actual
  end

  test 'button size' do
    actual   = ui_button('state', size: :sm)
    expected = '<button class="btn-secondary btn btn-sm">state</button>'

    assert_equal expected, actual
  end

  test 'button toggle' do
    actual   = ui_button('state', toggle: true)
    expected = '<button class="btn-secondary btn" data-bs-toggle="button" aria-pressed="false" autocomplete="off">state</button>'

    assert_equal expected, actual
  end

  test 'button glyph' do
    actual   = ui_button('state', glyph: 'diamond')
    expected = "<button class=\"btn-secondary btn\"><i class=\"glyph fa-solid fa-diamond\"></i> state</button>"

    assert_equal expected, actual
  end

  test 'button glyph without text' do
    actual   = ui_button('state', glyph: 'diamond', text: false)
    expected = "<button class=\"btn-secondary btn\"><i class=\"glyph fa-solid fa-diamond\"></i> <span class=\"visually-hidden\">state</span></button>"

    assert_equal expected, actual
  end

  test 'button with collapse' do
    actual   = ui_button('state', collapse: 'collapse-id')
    expected = '<button class="btn-secondary btn" data-bs-toggle="collapse" data-bs-target="#collapse-id" aria-controls="collapse-id" aria-expanded="false">state</button>'

    assert_equal expected, actual
  end

  test 'button with simple popover' do
    actual = ui_button('My Button', popover: 'My popover')
    expected = '<button data-bs-toggle="popover" data-bs-content="My popover" class="btn-secondary btn">My Button</button>'

    assert_equal expected, actual
  end

  test 'button with complex popover' do
    actual = ui_button('My Button', popover: { content: 'My popover', position: :left, html: true })
    expected = "<button data-bs-toggle=\"popover\" data-bs-content=\"My popover\" data-bs-placement=\"left\" data-bs-html=\"true\" class=\"btn-secondary btn\">My Button</button>"

    assert_equal expected, actual
  end

  test 'button with simple tooltip' do
    actual = ui_button('My Button', { tooltip: 'My Button' }, { title: 'My tooltip' })
    expected = '<button title="My tooltip" data-bs-toggle="tooltip" data-bs-title="My Button" class="btn-secondary btn">My Button</button>'

    assert_equal expected, actual
  end

  test 'button with complex tooltip' do
    actual = ui_button('My Button', tooltip: { title: 'My tooltip', position: :left })
    expected = '<button data-bs-toggle="tooltip" data-bs-title="My tooltip" data-bs-placement="left" class="btn-secondary btn">My Button</button>'

    assert_equal expected, actual
  end
end
