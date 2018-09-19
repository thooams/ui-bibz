module GlyphExtension

  # Render glyph and content html
  def glyph_and_content_html content_html = nil
    [glyph_with_space, ct_html(content_html)].compact.join(' ').html_safe
  end

  def ct_html content_html
    if options[:text].nil? || options[:text] == true
      content_html || content
    end
  end

  # Render glyph with space html
  def glyph_with_space
    out = [glyph]
    out << " " if options[:text] != false
    out.join unless glyph.nil?
  end

  # Render glyph html
  def glyph
    options[:content] = content if options[:text] == false

    glyph_options = if options[:glyph].kind_of?(Hash)
      options[:glyph]
    elsif options[:glyph].kind_of?(String)
      { name: options[:glyph] }
    else
      {}
    end

    glyph_options[:text]    = options[:text] unless options[:text].nil?
    glyph_options[:content] = options[:content] unless options[:content].nil?

    UiBibz::Utils::GlyphChanger.new(glyph_options[:name], glyph_options).render unless glyph_options[:name].nil?
  end

end
