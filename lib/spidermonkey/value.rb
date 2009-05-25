module SpiderMonkey
  module ToJS

    def to_js(context)
      
      case self
        
      when Class, Hash, Module, File, Struct, Object, Array
        if self.kind_of?(SpiderMonkey::RubyLandProxy)
          JSValue.new(context, self.js_value)
        else
          JSValue.new(context, JSLandProxy.make(self))
        end
        
      end

    end

  end
end

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

    end

    def root
      SpiderMonkey.JS_AddNamedRoot(@context, @ptr, "Test root")
    end

    def unroot
      SpiderMonkey.JS_RemoveRoot(@context, @ptr)
    end

    def to_object
      js_object = FFI::MemoryPointer.new(:pointer)
      SpiderMonkey.JS_ValueToObject(@context, @js_value, js_object)
      js_object.read_pointer
    end

    def to_ruby
      case SpiderMonkey.JS_TypeOfValue(@context, @value)
        
      when SpiderMonkey::JSTYPE_VOID
        unroot
        return nil

      when SpiderMonkey::JSTYPE_BOOLEAN
        unroot
        return @value == SpiderMonkey::JSVAL_TRUE ? true : false
        
      when SpiderMonkey::JSTYPE_NUMBER
        if SpiderMonkey.JSVAL_IS_INT(@value)
          unroot
          return to_ruby_fixnum_or_bignum
        else
          unroot
          return to_ruby_float
        end

      when SpiderMonkey::JSTYPE_OBJECT, SpiderMonkey::JSTYPE_FUNCTION

        if context.global.to_ptr.read_long == @value
          unroot
          return SpiderMonkey::RubyLandProxy.make_ruby_land_proxy(self, js, 'GlobalProxy')
        end  
                
        unroot
        return SpiderMonkey::RubyLandProxy.make(self, @value)

      end      

    end
    
    private

    def to_ruby_fixnum_or_bignum
      SpiderMonkey.JSVAL_TO_INT(@value)
    end

    def to_ruby_float
      rvalue = FFI::MemoryPointer.new(:double)
      SpiderMonkey.JS_ValueToNumber(@context, @value, rvalue)
      rvalue.get_double(0)
    end

  end
end
