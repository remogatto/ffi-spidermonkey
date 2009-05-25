require File.expand_path(File.join(File.dirname(__FILE__), "/../helper"))

module SpiderMonkey

  class JSValueTest < SpiderMonkey::TestCase

    def test_can_be_initialized_with_pointer
      pointer = FFI::MemoryPointer.new(:long).write_long(0x123)
      js_value = JSValue.new(@runtime.context, pointer)
      js_value.root
      assert_equal(0x123, js_value.value)
      js_value.unroot
    end

    def test_can_be_initialized_with_a_long
      long_value = 0x12345
      js_value = JSValue.new(@runtime.context, long_value)
      assert_equal(long_value, js_value.value)
    end

    def test_accept_evaluation_result
      js_value = JSValue.new(@runtime.context, @runtime.evaluate_and_return_jsval("1+1"))
    end

  end

end
