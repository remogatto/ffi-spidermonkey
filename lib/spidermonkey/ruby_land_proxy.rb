module SpiderMonkey
  class RubyLandProxy

    attr_reader :js_value

    class << self
      protected :new

      def make(context, value)
        self.new(context, value)
      end

    end

    def initialize(runtime, value)
      @runtime = runtime
      @context = @runtime.context
      @js_value = value

      js_object = FFI::MemoryPointer.new(:pointer)
      SpiderMonkey.JS_ValueToObject(@context, @js_value, js_object)
      @js_object = js_object.read_pointer
    end

    def [](name)
      get(name)
    end

    def []=(name, value)
      set(name, value)
    end

    def get(name)
      
    end

    def set(name, value)

      value.extend ToJS

      case name
        
      when Fixnum
        SpiderMonkey.JS_SetElement(@context, @js_object, name, value.to_js(@context))
      else
        SpiderMonkey.JS_SetProperty(@context, @js_object, name, value.to_js(@context))
      end

      value

    end

  end
end
