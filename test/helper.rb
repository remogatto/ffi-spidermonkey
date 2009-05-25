$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "../lib")))

require 'ffi-spidermonkey'
require 'test/unit'

module SpiderMonkey

  class TestCase < Test::Unit::TestCase

    undef :default_test if method_defined? :default_test

    def setup
      @runtime = SpiderMonkey::Runtime.new
      @runtime.gc_zeal = 2
    end
    
  end
end
