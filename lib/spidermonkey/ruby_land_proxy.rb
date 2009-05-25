module SpiderMonkey
  class RubyLandProxy

    attr_reader :js_value

    class << self
      protected :new

      def make(context, value, name = '')
        self.new(context, value, name)
      end

    end

    def initialize(runtime, value, name)
      @runtime = runtime
      @context = @runtime.context
      @js_value = JSValue.new(@context, value)
      @js_value.root_rt
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
        SpiderMonkey.JS_SetElement(@context, @js_value.to_object, name, value.to_js(@context))
      else
        SpiderMonkey.JS_SetProperty(@context, @js_value.to_object, name, value.to_js(@context))
      end

      value

    end

  end
end
