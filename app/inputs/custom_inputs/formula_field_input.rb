module CustomInputs
  class FormulaFieldInput < StringInput
    include UiBibz::Ui::Core::Forms::Numbers

    def input(wrapper_options)
      UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(input_attribute_name, new_options, input_html_options).render
    end

  end
end
