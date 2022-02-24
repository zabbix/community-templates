# raw_include_relative.rb
module Jekyll
    module Tags
      class RawIncludeTag < IncludeTag
        # Overriding is explicitly allowed, to modify file content by subclassing:
        # https://github.com/jekyll/jekyll/blob/f5826eed3cde692f84e35140209d5a59ec3eb295/lib/jekyll/tags/include.rb#L178
        def read_file(file, context)
          # Hack: instead of including the file directly without liquid escaping,
          # simply wrap the entire file in a `raw` liquid tag, suppressing liquid
          # processing.
          "{% raw %}" + super + "{% endraw %}"
        end
      end
    end
  end
  
  Liquid::Template.register_tag("raw_include", Jekyll::Tags::RawIncludeTag)