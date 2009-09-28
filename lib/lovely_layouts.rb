module LovelyLayouts

  module ContentHelpers


    def title(string)
      content_for(:title, string)
    end

    def title_tag(*args)
      options = args.extract_options!
      content_tag(:title, "#{options[:prefix]}#{(@content_for_title||args.first)}#{options[:suffix]}")
    end

    def description(string)
      content_for(:description, string)
    end

    def description_tag(default='')
      content = @content_for_description || default
      tag(:meta, :name => "description", :content => content) unless content.blank?
    end


    def keywords(string)
      content_for(:keywords, string)
    end

    def keywords_tag(default='')
      content = @content_for_keywords || default
      tag(:meta, :name => "keywords", :content => content) unless content.blank?
    end


    def copyright(string)
      content_for(:copyright, string)
    end

    def copyright_tag(default='')
      content = @content_for_copyright || default
      tag(:meta, :name => "copyright", :content => content) unless content.blank?
    end


    def body_id(string)
      content_for(:body_id, string)
    end

    def body_class(string)
      content_for(:body_class, string)
    end


    def body(*args, &block)
      options = args.extract_options!
      options[:class] ||= @content_for_body_class || default_body_class
      options[:id] ||= @content_for_body_id || default_body_id

      contents = capture(&block)

      concat(content_tag(:body, contents, options))
    end


    protected

    def default_body_id
      params[:controller].gsub('/','_')
    end

    def default_body_class
      [params[:controller], params[:action]].join(" ").gsub('/','_')
    end


  end

end

