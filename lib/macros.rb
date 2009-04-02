require 'spidermonkey'

module SpiderMonkey
  class << self
    def JSVAL_SETTAG(v, t)
      v | t
    end
    def JSVAL_INT_POW2(n)
      1 << n
    end
    def INT_TO_JSVAL(i)
      ((i << 1) | JSVAL_INT)
    end
    def OBJECT_TO_JSVAL(obj)
      obj
    end
    def BOOLEAN_TO_JSVAL(b)
      JSVAL_SETTAG(b << JSVAL_TAGBITS, JSVAL_BOOLEAN)
    end
  end
end
