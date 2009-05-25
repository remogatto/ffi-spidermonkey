require File.expand_path(File.join(File.dirname(__FILE__), "/../helper"))

module SpiderMonkey

  class RuntimeTest < SpiderMonkey::TestCase

    def setup
      @runtime = SpiderMonkey::Runtime.new
    end
    
    def test_can_create_more_than_one_without_barfing
      assert_nothing_raised { SpiderMonkey::Runtime.new }
    end

    def test_evaluate_script
      result = @runtime.evaluate("1+1")
      assert_equal(2, result)
    end

  end

end
