require File.join(File.dirname(__FILE__), *%w[.. lib attribute_normalizer])
ActiveRecord::Base.send(:include, AttributeNormalizer)
