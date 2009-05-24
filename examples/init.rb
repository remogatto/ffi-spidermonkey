$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "..", "lib")))

require 'ffi-spidermonkey'

include SpiderMonkey

# The class of the global object.
global_class = JSClass.allocate

# Global class initialization

global_class.name = 'global'
global_class[:flags] = JSCLASS_GLOBAL_FLAGS
global_class[:addProperty] = method(:JS_PropertyStub).to_proc
global_class[:delProperty] = method(:JS_PropertyStub).to_proc
global_class[:getProperty] = method(:JS_PropertyStub).to_proc
global_class[:setProperty] = method(:JS_PropertyStub).to_proc
global_class[:enumerate] = method(:JS_EnumerateStub).to_proc
global_class[:resolve] = method(:JS_ResolveStub).to_proc
global_class[:convert] = method(:JS_ConvertStub).to_proc
global_class[:finalize] = method(:JS_FinalizeStub).to_proc

def report_error(context, message, report)
  report_struct = JSErrorReport.new(report)
  printf("%s:%u:%s\n",
         report_struct[:filename] ? report_struct[:filename] : "<no filename>", 
         report_struct[:lineno],
         message)
end

rt = JS_NewRuntime(8 * 1024 * 1024)

cx = JS_NewContext(rt, 8192)
JS_SetOptions(cx, JSOPTION_VAROBJFIX | JSOPTION_DONT_REPORT_UNCAUGHT)
JS_SetVersion(cx, JSVERSION_DEFAULT)
JS_SetErrorReporter(cx, method('report_error').to_proc)

global = JS_NewObject(cx, global_class.to_ptr, nil, nil)
# JS_InitStandardClasses(cx, global)

lineno = 0
rval = FFI::MemoryPointer.new(:pointer)
script = "1+1"
JS_EvaluateScript(cx, global, script, script.size, 'fn', lineno, rval);

JS_AddNamedRoot(cx, rval, "Return value")

val = FFI::MemoryPointer.new(:double, 1)
JS_ValueToNumber(cx, rval.get_int(0), val);
p val.get_double(0)

JS_RemoveRoot(cx, rval)

JS_DestroyContext(cx)

JS_DestroyRuntime(rt)
JS_ShutDown()

