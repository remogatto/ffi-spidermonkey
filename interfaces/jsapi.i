%module spidermonkey

%{
require 'rubygems'
require 'ffi'
module SpiderMonkey
  extend FFI::Library
  ffi_lib 'mozjs'
%}

#define XP_UNIX
#define JS_BYTES_PER_BYTE 1
#define JS_BYTES_PER_SHORT 2
#define JS_BYTES_PER_INT 4
#define JS_HAVE_LONG_LONG
#define JS_BYTES_PER_LONG 8
%include jstypes.h
%include jsotypes.h
%include jscompat.h
/* %include jslong.h */
/* %include jspubtd.h */
/* %include fdlibm.h 	 */
/* %include jsarena.h 	 */
/* %include jsatom.h  */
/* %include jsautocfg.h 	 */
/* %include jsautokw.h 	 */
/* %include jsbit.h 	 */
/* %include jsbool.h */
/* %include jsclist.h  */
/* %include jscntxt.h 	 	 */
/* %include jsconfig.h 	 */
/* %include jsdate.h */
/* %include jsdhash.h 	 */
/* %include jsemit.h 	 */
/* %include jsfun.h 	 */
/* %include jsgc.h */
/* %include jshash.h  */
/* %include jsinterp.h 	 */
/* %include jsiter.h 	 */
/* %include jslock.h 	 */
%include jslong.h
/* %include jsmath.h  */
/* %include jsnum.h 	 */
/* %include jsobj.h 	 */
/* %include jsopcode.h 	 */
/* %include jsopcode.tbl */
/* %include jsosdep.h  */
/* %include jsotypes.h 	 */
/* %include jsparse.h 	 */
/* %include jsprf.h 	 */
/* %include jsproto.tbl */
/* %include jsprvtd.h  */
%include jspubtd.h
/* %include jsregexp.h 	 */
/* %include jsscan.h 	 */
/* %include jsscope.h */
/* %include jsscript.h  */
/* %include jsstddef.h */
/* %include jsstr.h 	 */
/* %include jstypes.h 	 */
/* %include jsutil.h */
/* %include jsxdrapi.h 	 */
/* %include jsxml.h */
/* %include jsarray.h */
%include jsapi.h

%{
end
%}
