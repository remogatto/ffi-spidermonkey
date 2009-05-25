module SpiderMonkey
  class JSValue

    include HasPointer

    attr_reader :value, :context

    def initialize(context, pointer_or_value)

      @context = context

      if pointer_or_value.kind_of?(FFI::Pointer)
        @value = pointer_or_value.read_long
        @ptr = pointer_or_value
      elsif pointer_or_value.kind_of?(Fixnum) or pointer_or_value.kind_of?(Bignum)
        @value = pointer_or_value
        @ptr = FFI::MemoryPointer.new(:long).write_long(@value)
      else
        raise "Invalid initialization value for SpiderMonkey::JSValue"
      end

      add_root

    end

    private

    def add_root
      SpiderMonkey.JS_AddNamedRoot(@context, @ptr, "Test root")
    end

  end
end
