require 'spidermonkey'

module SpiderMonkey
  alias :JS_NewRuntime :JS_Init
  alias :JS_DestroyRuntime :JS_Finish
  alias :JS_LockRuntime :JS_Lock
  alias :JS_UnlockRuntime :JS_Unlock
end
