require File.join(File.dirname(__FILE__), *%w[.. lib lovely_layouts])
ActionView::Base.send :include, LovelyLayouts::ContentHelpers