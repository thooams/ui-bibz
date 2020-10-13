# frozen_string_literal: true

module UiBibzInputs
  class UiSliderFieldInput < UiTextFieldInput
    include UiBibz::Ui::Core::Forms::Numbers

    def input(_wrapper_options)
      UiBibz::Ui::Core::Forms::Numbers::SliderField.new(input_attribute_name, options, input_html_options).render
    end
  end
end