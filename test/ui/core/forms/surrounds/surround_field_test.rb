# frozen_string_literal: true

require 'test_helper'

class SurroundFieldTest < ActionView::TestCase
  test 'surround_field with glyph' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.glyph 'pencil'
    end.render
    expected = '<div class="input-group ui_surround_field"><span class="input-group-text"><i class="glyph fas fa-pencil"></i></span></div>'

    assert_equal expected, actual
  end

  test 'surround_field with addon' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.addon 'content addon'
    end.render
    expected = '<div class="input-group ui_surround_field"><span class="input-group-text">content addon</span></div>'

    assert_equal expected, actual
  end

  test 'surround_field with dropdown' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.dropdown 'Dropdown', {}, { id: 'dropdown-test' } do |d|
        d.link 'Link 1', url: '#link1', glyph: 'eye'
        d.header 'header'
        d.link 'Link 2', url: '#link2'
        d.divider
        d.link 'Link3', url: '#link3'
      end
    end.render
    expected = '<div class="input-group ui_surround_field"><div id="dropdown-test" class="dropdown input-group-btn"><button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dropdown-test">Dropdown</button><div class="dropdown-menu" arial-labelledby="dropdown-test"><a class="dropdown-item" href="#link1"><i class="glyph fas fa-eye"></i>  Link 1</a><h6 class="dropdown-header" role="presentation">header</h6><a class="dropdown-item" href="#link2">Link 2</a><div class="dropdown-divider"></div><a class="dropdown-item" href="#link3">Link3</a></div></div></div>'

    assert_equal expected, actual
  end

  test 'surround_field with button' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.button 'Submit'
    end.render
    expected = '<div class="input-group ui_surround_field"><div class="input-group-btn"><button class="btn-secondary btn">Submit</button></div></div>'

    assert_equal expected, actual
  end

  test 'surround_field with button, addon, glyph' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.button 'Submit'
      sf.addon '€'
      sf.glyph 'pencil'
    end.render
    expected = '<div class="input-group ui_surround_field"><div class="input-group-btn"><button class="btn-secondary btn">Submit</button></div><span class="input-group-text">€</span><span class="input-group-text"><i class="glyph fas fa-pencil"></i></span></div>'

    assert_equal expected, actual
  end

  test 'surround_field with html' do
    actual = UiBibz::Ui::Core::Forms::Surrounds::SurroundField.new.tap do |sf|
      sf.html 'Content'
      sf.html do
        " Content 2"
      end
    end.render
    expected = "<div class=\"input-group ui_surround_field\">Content Content 2</div>"

    assert_equal expected, actual
  end
end
