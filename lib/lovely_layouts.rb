module LovelyLayouts
  
  module ContentHelpers
    

    def title(string)
      content_for(:title, string)
    end
    
    def title_tag(default='')
      content_tag(:title, @content_for_title || default)
    end
    

    def description(string)
      content_for(:description, string)
    end

    def description_tag(default='')
      tag(:meta, :name => "description", :content => @content_for_description)
    end


    def keywords(string)
      content_for(:keywords, string)
    end

    def keywords_tag(default='')
      tag(:meta, :name => "keywords", :content => @content_for_keywords || default)
    end
    

    def copyright(string)
      content_for(:copyright, string)
    end

    def copyright_tag(default='')
      tag(:meta, :name => "copyright", :content => @content_for_copyright || default)
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
      params[:controller]
    end
    
    def default_body_class
      [params[:controller], params[:action]].join(" ")
    end
    
    
  end

end