require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib jsapi_wrap]))

include JsAPI

# The class of the global object.
global_class = JSClass.new

# Global class initialization

global_class[:name] = FFI::MemoryPointer.from_string('global')
# global_class[:flags] = JSCLASS_IS_GLOBAL # crash using JSCLASS_IS_GLOBAL
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

# Must be JS_NewRuntime
rt = JS_Init(8 * 1024 * 1024)

cx = JS_NewContext(rt, 8192)
JS_SetOptions(cx, JSOPTION_VAROBJFIX)
JS_SetVersion(cx, JSVERSION_DEFAULT)
JS_SetErrorReporter(cx, method('report_error').to_proc)

global = JS_NewObject(cx, global_class.to_ptr, nil, nil)
JS_InitStandardClasses(cx, global)

lineno = 0
rval = FFI::MemoryPointer.new(:pointer)
script = "3*(2+1)+1"
JS_EvaluateScript(cx, global, script, script.size, 'fn', lineno, rval);
val = FFI::MemoryPointer.new(:double, 1)
JS_ValueToNumber(cx, rval.get_int(0), val);
p val.get_double(0)

JS_DestroyContext(cx)

# must be JS_DestroyRuntime
JS_Finish(rt)
JS_ShutDown()

