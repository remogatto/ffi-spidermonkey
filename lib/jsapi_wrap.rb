require 'rubygems'
require 'ffi'
module JsAPI
  extend FFI::Library
  ffi_lib 'mozjs'
  JS_BYTES_PER_BYTE = 1
  JS_BYTES_PER_SHORT = 2
  JS_BYTES_PER_INT = 4
  JS_BYTES_PER_LONG = 8
  attach_function :JSLL_MaxInt, [  ], :long
  attach_function :JSLL_MinInt, [  ], :long
  attach_function :JSLL_Zero, [  ], :long
  JSVERSION_UNKNOWN = -1
  JSVERSION_DEFAULT = 0
  JSVERSION_1_0 = 100
  JSVERSION_1_1 = 110
  JSVERSION_1_2 = 120
  JSVERSION_1_3 = 130
  JSVERSION_1_4 = 140
  JSVERSION_ECMA_3 = 148
  JSVERSION_1_5 = 150
  JSVERSION_1_6 = 160
  JSVERSION_1_7 = 170

  JSTYPE_VOID = 0
  JSTYPE_OBJECT = 1
  JSTYPE_FUNCTION = 2
  JSTYPE_STRING = 3
  JSTYPE_NUMBER = 4
  JSTYPE_BOOLEAN = 5
  JSTYPE_NULL = 6
  JSTYPE_XML = 7
  JSTYPE_LIMIT = 8

  JSProto_LIMIT = 0

  JSACC_PROTO = 0
  JSACC_PARENT = 1
  JSACC_IMPORT = 2
  JSACC_WATCH = 3
  JSACC_READ = 4
  JSACC_WRITE = 8
  JSACC_LIMIT = 9

  JSENUMERATE_INIT = 0
  JSENUMERATE_NEXT = 1
  JSENUMERATE_DESTROY = 2

  callback(:JSPropertyOp, [ :pointer, :pointer, :long, :pointer ], :int)
  callback(:JSNewEnumerateOp, [ :pointer, :pointer, :int, :pointer, :pointer ], :int)
  callback(:JSEnumerateOp, [ :pointer, :pointer ], :int)
  callback(:JSResolveOp, [ :pointer, :pointer, :long ], :int)
  callback(:JSNewResolveOp, [ :pointer, :pointer, :long, :uint, :pointer ], :int)
  callback(:JSConvertOp, [ :pointer, :pointer, :int, :pointer ], :int)
  callback(:JSFinalizeOp, [ :pointer, :pointer ], :void)
  callback(:JSStringFinalizeOp, [ :pointer, :pointer ], :void)
  callback(:JSGetObjectOps, [ :pointer, :pointer ], :pointer)
  callback(:JSCheckAccessOp, [ :pointer, :pointer, :long, :int, :pointer ], :int)
  callback(:JSXDRObjectOp, [ :pointer, :pointer ], :int)
  callback(:JSHasInstanceOp, [ :pointer, :pointer, :long, :pointer ], :int)
  callback(:JSMarkOp, [ :pointer, :pointer, :pointer ], :uint)
  callback(:JSReserveSlotsOp, [ :pointer, :pointer ], :uint)
  callback(:JSNewObjectMapOp, [ :pointer, :int, :pointer, :pointer, :pointer ], :pointer)
  callback(:JSObjectMapOp, [ :pointer, :pointer ], :void)
  callback(:JSLookupPropOp, [ :pointer, :pointer, :long, :pointer, :pointer ], :int)
  callback(:JSDefinePropOp, [ :pointer, :pointer, :long, :long, :JSPropertyOp, :JSPropertyOp, :uint, :pointer ], :int)
  callback(:JSPropertyIdOp, [ :pointer, :pointer, :long, :pointer ], :int)
  callback(:JSAttributesOp, [ :pointer, :pointer, :long, :pointer, :pointer ], :int)
  callback(:JSCheckAccessIdOp, [ :pointer, :pointer, :long, :int, :pointer, :pointer ], :int)
  callback(:JSObjectOp, [ :pointer, :pointer ], :pointer)
  callback(:JSPropertyRefOp, [ :pointer, :pointer, :pointer ], :void)
  callback(:JSSetObjectSlotOp, [ :pointer, :pointer, :uint, :pointer ], :int)
  callback(:JSGetRequiredSlotOp, [ :pointer, :pointer, :uint ], :long)
  callback(:JSSetRequiredSlotOp, [ :pointer, :pointer, :uint, :long ], :int)
  callback(:JSGetMethodOp, [ :pointer, :pointer, :long, :pointer ], :pointer)
  callback(:JSSetMethodOp, [ :pointer, :pointer, :long, :pointer ], :int)
  callback(:JSEnumerateValuesOp, [ :pointer, :pointer, :int, :pointer, :pointer, :pointer ], :int)
  callback(:JSEqualityOp, [ :pointer, :pointer, :long, :pointer ], :int)
  callback(:JSConcatenateOp, [ :pointer, :pointer, :long, :pointer ], :int)
  callback(:JSNative, [ :pointer, :pointer, :uint, :pointer, :pointer ], :int)
  JSCONTEXT_NEW = 0
  JSCONTEXT_DESTROY = 1

  callback(:JSContextCallback, [ :pointer, :uint ], :int)
  JSGC_BEGIN = 0
  JSGC_END = 1
  JSGC_MARK_END = 2
  JSGC_FINALIZE_END = 3

  callback(:JSGCCallback, [ :pointer, :int ], :int)
  callback(:JSBranchCallback, [ :pointer, :pointer ], :int)
  callback(:JSErrorReporter, [ :pointer, :string, :pointer ], :void)
  JSEXN_NONE = -1
  JSEXN_ERR = 0
  JSEXN_INTERNALERR = 1
  JSEXN_EVALERR = 2
  JSEXN_RANGEERR = 3
  JSEXN_REFERENCEERR = 4
  JSEXN_SYNTAXERR = 5
  JSEXN_TYPEERR = 6
  JSEXN_URIERR = 7
  JSEXN_LIMIT = 8

  class JSErrorFormatString < FFI::Struct
    layout(
           :format, :string,
           :argCount, :ushort,
           :exnType, :short
    )
  end
  callback(:JSErrorCallback, [ :pointer, :string, :uint ], :pointer)
  callback(:JSLocaleToUpperCase, [ :pointer, :pointer, :pointer ], :int)
  callback(:JSLocaleToLowerCase, [ :pointer, :pointer, :pointer ], :int)
  callback(:JSLocaleCompare, [ :pointer, :pointer, :pointer, :pointer ], :int)
  callback(:JSLocaleToUnicode, [ :pointer, :string, :pointer ], :int)
  callback(:JSPrincipalsTranscoder, [ :pointer, :pointer ], :int)
  callback(:JSObjectPrincipalsFinder, [ :pointer, :pointer ], :pointer)
  JSVAL_OBJECT = 0x0
  JSVAL_INT = 0x1
  JSVAL_DOUBLE = 0x2
  JSVAL_STRING = 0x4
  JSVAL_BOOLEAN = 0x6
  JSVAL_TAGBITS = 3
  JSVAL_INT_BITS = 31
  JSPROP_ENUMERATE = 0x01
  JSPROP_READONLY = 0x02
  JSPROP_PERMANENT = 0x04
  JSPROP_EXPORTED = 0x08
  JSPROP_GETTER = 0x10
  JSPROP_SETTER = 0x20
  JSPROP_SHARED = 0x40
  JSPROP_INDEX = 0x80
  JSFUN_LAMBDA = 0x08
  JSFUN_GETTER = 0x10
  JSFUN_SETTER = 0x20
  JSFUN_BOUND_METHOD = 0x40
  JSFUN_HEAVYWEIGHT = 0x80
  JSFUN_THISP_STRING = 0x0100
  JSFUN_THISP_NUMBER = 0x0200
  JSFUN_THISP_BOOLEAN = 0x0400
  JSFUN_THISP_PRIMITIVE = 0x0700
  JSFUN_FLAGS_MASK = 0x07f8
  JSFUN_GENERIC_NATIVE = 0x08
  attach_function :JS_Now, [  ], :long
  attach_function :JS_GetNaNValue, [ :pointer ], :long
  attach_function :JS_GetNegativeInfinityValue, [ :pointer ], :long
  attach_function :JS_GetPositiveInfinityValue, [ :pointer ], :long
  attach_function :JS_GetEmptyStringValue, [ :pointer ], :long
  attach_function :JS_ConvertArguments, [ :pointer, :uint, :pointer, :string, :varargs ], :int
  attach_function :JS_PushArguments, [ :pointer, :pointer, :string, :varargs ], :pointer
  attach_function :JS_PopArguments, [ :pointer, :pointer ], :void
  attach_function :JS_ConvertValue, [ :pointer, :long, :int, :pointer ], :int
  attach_function :JS_ValueToObject, [ :pointer, :long, :pointer ], :int
  attach_function :JS_ValueToFunction, [ :pointer, :long ], :pointer
  attach_function :JS_ValueToConstructor, [ :pointer, :long ], :pointer
  attach_function :JS_ValueToString, [ :pointer, :long ], :pointer
  attach_function :JS_ValueToNumber, [ :pointer, :long, :pointer ], :int
  attach_function :JS_ValueToECMAInt32, [ :pointer, :long, :pointer ], :int
  attach_function :JS_ValueToECMAUint32, [ :pointer, :long, :pointer ], :int
  attach_function :JS_ValueToInt32, [ :pointer, :long, :pointer ], :int
  attach_function :JS_ValueToUint16, [ :pointer, :long, :pointer ], :int
  attach_function :JS_ValueToBoolean, [ :pointer, :long, :pointer ], :int
  attach_function :JS_TypeOfValue, [ :pointer, :long ], :int
  attach_function :JS_GetTypeName, [ :pointer, :int ], :string
  attach_function :JS_Init, [ :uint ], :pointer
  attach_function :JS_Finish, [ :pointer ], :void
  attach_function :JS_ShutDown, [  ], :void
  attach_function :JS_GetRuntimePrivate, [ :pointer ], :pointer
  attach_function :JS_SetRuntimePrivate, [ :pointer, :pointer ], :void
  attach_function :JS_Lock, [ :pointer ], :void
  attach_function :JS_Unlock, [ :pointer ], :void
  attach_function :JS_SetContextCallback, [ :pointer, :JSContextCallback ], :JSContextCallback
  attach_function :JS_NewContext, [ :pointer, :uint ], :pointer
  attach_function :JS_DestroyContext, [ :pointer ], :void
  attach_function :JS_DestroyContextNoGC, [ :pointer ], :void
  attach_function :JS_DestroyContextMaybeGC, [ :pointer ], :void
  attach_function :JS_GetContextPrivate, [ :pointer ], :pointer
  attach_function :JS_SetContextPrivate, [ :pointer, :pointer ], :void
  attach_function :JS_GetRuntime, [ :pointer ], :pointer
  attach_function :JS_ContextIterator, [ :pointer, :pointer ], :pointer
  attach_function :JS_GetVersion, [ :pointer ], :int
  attach_function :JS_SetVersion, [ :pointer, :int ], :int
  attach_function :JS_VersionToString, [ :int ], :string
  attach_function :JS_StringToVersion, [ :string ], :int
  attach_function :JS_GetOptions, [ :pointer ], :uint
  attach_function :JS_SetOptions, [ :pointer, :uint ], :uint
  attach_function :JS_ToggleOptions, [ :pointer, :uint ], :uint
  attach_function :JS_GetImplementationVersion, [  ], :string
  attach_function :JS_GetGlobalObject, [ :pointer ], :pointer
  attach_function :JS_SetGlobalObject, [ :pointer, :pointer ], :void
  attach_function :JS_InitStandardClasses, [ :pointer, :pointer ], :int
  attach_function :JS_ResolveStandardClass, [ :pointer, :pointer, :long, :pointer ], :int
  attach_function :JS_EnumerateStandardClasses, [ :pointer, :pointer ], :int
  attach_function :JS_EnumerateResolvedStandardClasses, [ :pointer, :pointer, :pointer ], :pointer
  attach_function :JS_GetClassObject, [ :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_GetScopeChain, [ :pointer ], :pointer
  attach_function :JS_malloc, [ :pointer, :uint ], :pointer
  attach_function :JS_realloc, [ :pointer, :pointer, :uint ], :pointer
  attach_function :JS_free, [ :pointer, :pointer ], :void
  attach_function :JS_strdup, [ :pointer, :string ], :string
  attach_function :JS_NewDouble, [ :pointer, :double ], :pointer
  attach_function :JS_NewDoubleValue, [ :pointer, :double, :pointer ], :int
  attach_function :JS_NewNumberValue, [ :pointer, :double, :pointer ], :int
  attach_function :JS_AddRoot, [ :pointer, :pointer ], :int
  attach_function :JS_AddNamedRoot, [ :pointer, :pointer, :string ], :int
  attach_function :JS_AddNamedRootRT, [ :pointer, :pointer, :string ], :int
  attach_function :JS_RemoveRoot, [ :pointer, :pointer ], :int
  attach_function :JS_RemoveRootRT, [ :pointer, :pointer ], :int
  attach_function :JS_ClearNewbornRoots, [ :pointer ], :void
  attach_function :JS_EnterLocalRootScope, [ :pointer ], :int
  attach_function :JS_LeaveLocalRootScope, [ :pointer ], :void
  attach_function :JS_LeaveLocalRootScopeWithResult, [ :pointer, :long ], :void
  attach_function :JS_ForgetLocalRoot, [ :pointer, :pointer ], :void
  JS_MAP_GCROOT_NEXT = 0
  JS_MAP_GCROOT_STOP = 1
  JS_MAP_GCROOT_REMOVE = 2
  callback(:JSGCRootMapFun, [ :pointer, :string, :pointer ], :int)
  attach_function :JS_MapGCRoots, [ :pointer, :JSGCRootMapFun, :pointer ], :uint
  attach_function :JS_LockGCThing, [ :pointer, :pointer ], :int
  attach_function :JS_LockGCThingRT, [ :pointer, :pointer ], :int
  attach_function :JS_UnlockGCThing, [ :pointer, :pointer ], :int
  attach_function :JS_UnlockGCThingRT, [ :pointer, :pointer ], :int
  attach_function :JS_MarkGCThing, [ :pointer, :pointer, :string, :pointer ], :void
  attach_function :JS_GC, [ :pointer ], :void
  attach_function :JS_MaybeGC, [ :pointer ], :void
  attach_function :JS_SetGCCallback, [ :pointer, :JSGCCallback ], :JSGCCallback
  attach_function :JS_SetGCCallbackRT, [ :pointer, :JSGCCallback ], :JSGCCallback
  attach_function :JS_IsAboutToBeFinalized, [ :pointer, :pointer ], :int
  JSGC_MAX_BYTES = 0
  JSGC_MAX_MALLOC_BYTES = 1

  attach_function :JS_SetGCParameter, [ :pointer, :int, :uint ], :void
  attach_function :JS_AddExternalStringFinalizer, [ :JSStringFinalizeOp ], :int
  attach_function :JS_RemoveExternalStringFinalizer, [ :JSStringFinalizeOp ], :int
  attach_function :JS_NewExternalString, [ :pointer, :pointer, :uint, :int ], :pointer
  attach_function :JS_GetExternalStringGCType, [ :pointer, :pointer ], :int
  attach_function :JS_SetThreadStackLimit, [ :pointer, :ulong ], :void
  class JSClass < FFI::Struct
    layout(
           :name, :pointer, # :name declared as :pointer instead of :string
           :flags, :uint,
           :addProperty, :JSPropertyOp,
           :delProperty, :JSPropertyOp,
           :getProperty, :JSPropertyOp,
           :setProperty, :JSPropertyOp,
           :enumerate, :JSEnumerateOp,
           :resolve, :JSResolveOp,
           :convert, :JSConvertOp,
           :finalize, :JSFinalizeOp,
           :getObjectOps, :JSGetObjectOps,
           :checkAccess, :JSCheckAccessOp,
           :call, :JSNative,
           :construct, :JSNative,
           :xdrObject, :JSXDRObjectOp,
           :hasInstance, :JSHasInstanceOp,
           :mark, :JSMarkOp,
           :reserveSlots, :JSReserveSlotsOp
    )
  end
  #FIXME: callback should be inlined within structs
  callback(:reserved0, [  ], :void)
  callback(:reserved1, [  ], :void)
  callback(:reserved2, [  ], :void)
  callback(:reserved3, [  ], :void)
  callback(:reserved4, [  ], :void)
  class JSExtendedClass < FFI::Struct
    layout(
           :base, JSClass,
           :equality, :JSEqualityOp,
           :outerObject, :JSObjectOp,
           :innerObject, :JSObjectOp,
           :reserved0, :reserved0,
           :reserved1, :reserved1,
           :reserved2, :reserved2,
           :reserved3, :reserved3,
           :reserved4, :reserved4
    )
  end
  JSCLASS_HAS_PRIVATE = (1 << 0)
  JSCLASS_NEW_ENUMERATE = (1 << 1)
  JSCLASS_NEW_RESOLVE = (1 << 2)
  JSCLASS_PRIVATE_IS_NSISUPPORTS = (1 << 3)
  JSCLASS_SHARE_ALL_PROPERTIES = (1 << 4)
  JSCLASS_NEW_RESOLVE_GETS_START = (1 << 5)
  JSCLASS_CONSTRUCT_PROTOTYPE = (1 << 6)
  JSCLASS_DOCUMENT_OBSERVER = (1 << 7)
  JSCLASS_RESERVED_SLOTS_SHIFT = 8
  JSCLASS_RESERVED_SLOTS_WIDTH = 8
  JSCLASS_HIGH_FLAGS_SHIFT = (8+8)
  JSCLASS_IS_EXTENDED = (1 << ((8+8) +0))
  JSCLASS_IS_ANONYMOUS = (1 << ((8+8) +1))
  JSCLASS_IS_GLOBAL = (1 << ((8+8) +2))
  JSCLASS_CACHED_PROTO_SHIFT = ((8+8) +8)
  JSCLASS_CACHED_PROTO_WIDTH = 8
  class JSObjectOps < FFI::Struct
    layout(
           :newObjectMap, :JSNewObjectMapOp,
           :destroyObjectMap, :JSObjectMapOp,
           :lookupProperty, :JSLookupPropOp,
           :defineProperty, :JSDefinePropOp,
           :getProperty, :JSPropertyIdOp,
           :setProperty, :JSPropertyIdOp,
           :getAttributes, :JSAttributesOp,
           :setAttributes, :JSAttributesOp,
           :deleteProperty, :JSPropertyIdOp,
           :defaultValue, :JSConvertOp,
           :enumerate, :JSNewEnumerateOp,
           :checkAccess, :JSCheckAccessIdOp,
           :thisObject, :JSObjectOp,
           :dropProperty, :JSPropertyRefOp,
           :call, :JSNative,
           :construct, :JSNative,
           :xdrObject, :JSXDRObjectOp,
           :hasInstance, :JSHasInstanceOp,
           :setProto, :JSSetObjectSlotOp,
           :setParent, :JSSetObjectSlotOp,
           :mark, :JSMarkOp,
           :clear, :JSFinalizeOp,
           :getRequiredSlot, :JSGetRequiredSlotOp,
           :setRequiredSlot, :JSSetRequiredSlotOp
    )
  end
  class JSXMLObjectOps < FFI::Struct
    layout(
           :base, JSObjectOps,
           :getMethod, :JSGetMethodOp,
           :setMethod, :JSSetMethodOp,
           :enumerateValues, :JSEnumerateValuesOp,
           :equality, :JSEqualityOp,
           :concatenate, :JSConcatenateOp
    )
  end
  class JSProperty < FFI::Struct
    layout(
           :id, :long
    )
  end
  class JSIdArray < FFI::Struct
    layout(
           :length, :int,
           :vector, [:long, 1]
    )
  end
  attach_function :JS_DestroyIdArray, [ :pointer, :pointer ], :void
  attach_function :JS_ValueToId, [ :pointer, :long, :pointer ], :int
  attach_function :JS_IdToValue, [ :pointer, :long, :pointer ], :int
  JSRESOLVE_QUALIFIED = 0x01
  JSRESOLVE_ASSIGNING = 0x02
  JSRESOLVE_DETECTING = 0x04
  JSRESOLVE_DECLARING = 0x08
  JSRESOLVE_CLASSNAME = 0x10
  attach_function :JS_PropertyStub, [ :pointer, :pointer, :long, :pointer ], :int
  attach_function :JS_EnumerateStub, [ :pointer, :pointer ], :int
  attach_function :JS_ResolveStub, [ :pointer, :pointer, :long ], :int
  attach_function :JS_ConvertStub, [ :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_FinalizeStub, [ :pointer, :pointer ], :void
  class JSConstDoubleSpec < FFI::Struct
    layout(
           :dval, :double,
           :name, :string,
           :flags, :uchar,
           :spare, [:uchar, 3]
    )
  end
  class JSPropertySpec < FFI::Struct
    layout(
           :name, :string,
           :tinyid, :char,
           :flags, :uchar,
           :getter, :JSPropertyOp,
           :setter, :JSPropertyOp
    )
  end
  class JSFunctionSpec < FFI::Struct
    layout(
           :name, :string,
           :call, :JSNative,
           :nargs, :ushort,
           :flags, :ushort,
           :extra, :uint
    )
  end
  attach_function :JS_InitClass, [ :pointer, :pointer, :pointer, :pointer, :JSNative, :uint, :pointer, :pointer, :pointer, :pointer ], :pointer
  attach_function :JS_GetClass, [ :pointer ], :pointer
  attach_function :JS_InstanceOf, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :JS_HasInstance, [ :pointer, :pointer, :long, :pointer ], :int
  attach_function :JS_GetPrivate, [ :pointer, :pointer ], :pointer
  attach_function :JS_SetPrivate, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_GetInstancePrivate, [ :pointer, :pointer, :pointer, :pointer ], :pointer
  attach_function :JS_GetPrototype, [ :pointer, :pointer ], :pointer
  attach_function :JS_SetPrototype, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_GetParent, [ :pointer, :pointer ], :pointer
  attach_function :JS_SetParent, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_GetConstructor, [ :pointer, :pointer ], :pointer
  attach_function :JS_GetObjectId, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_NewObject, [ :pointer, :pointer, :pointer, :pointer ], :pointer
  attach_function :JS_SealObject, [ :pointer, :pointer, :int ], :int
  attach_function :JS_ConstructObject, [ :pointer, :pointer, :pointer, :pointer ], :pointer
  attach_function :JS_ConstructObjectWithArguments, [ :pointer, :pointer, :pointer, :pointer, :uint, :pointer ], :pointer
  attach_function :JS_DefineObject, [ :pointer, :pointer, :string, :pointer, :pointer, :uint ], :pointer
  attach_function :JS_DefineConstDoubles, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_DefineProperties, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_DefineProperty, [ :pointer, :pointer, :string, :long, :JSPropertyOp, :JSPropertyOp, :uint ], :int
  attach_function :JS_GetPropertyAttributes, [ :pointer, :pointer, :string, :pointer, :pointer ], :int
  attach_function :JS_GetPropertyAttrsGetterAndSetter, [ :pointer, :pointer, :string, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :JS_SetPropertyAttributes, [ :pointer, :pointer, :string, :uint, :pointer ], :int
  attach_function :JS_DefinePropertyWithTinyId, [ :pointer, :pointer, :string, :char, :long, :JSPropertyOp, :JSPropertyOp, :uint ], :int
  attach_function :JS_AliasProperty, [ :pointer, :pointer, :string, :string ], :int
  attach_function :JS_HasProperty, [ :pointer, :pointer, :string, :pointer ], :int
  attach_function :JS_LookupProperty, [ :pointer, :pointer, :string, :pointer ], :int
  attach_function :JS_LookupPropertyWithFlags, [ :pointer, :pointer, :string, :uint, :pointer ], :int
  attach_function :JS_GetProperty, [ :pointer, :pointer, :string, :pointer ], :int
  attach_function :JS_GetMethodById, [ :pointer, :pointer, :long, :pointer, :pointer ], :int
  attach_function :JS_GetMethod, [ :pointer, :pointer, :string, :pointer, :pointer ], :int
  attach_function :JS_SetProperty, [ :pointer, :pointer, :string, :pointer ], :int
  attach_function :JS_DeleteProperty, [ :pointer, :pointer, :string ], :int
  attach_function :JS_DeleteProperty2, [ :pointer, :pointer, :string, :pointer ], :int
  attach_function :JS_DefineUCProperty, [ :pointer, :pointer, :pointer, :uint, :long, :JSPropertyOp, :JSPropertyOp, :uint ], :int
  attach_function :JS_GetUCPropertyAttributes, [ :pointer, :pointer, :pointer, :uint, :pointer, :pointer ], :int
  attach_function :JS_GetUCPropertyAttrsGetterAndSetter, [ :pointer, :pointer, :pointer, :uint, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :JS_SetUCPropertyAttributes, [ :pointer, :pointer, :pointer, :uint, :uint, :pointer ], :int
  attach_function :JS_DefineUCPropertyWithTinyId, [ :pointer, :pointer, :pointer, :uint, :char, :long, :JSPropertyOp, :JSPropertyOp, :uint ], :int
  attach_function :JS_HasUCProperty, [ :pointer, :pointer, :pointer, :uint, :pointer ], :int
  attach_function :JS_LookupUCProperty, [ :pointer, :pointer, :pointer, :uint, :pointer ], :int
  attach_function :JS_GetUCProperty, [ :pointer, :pointer, :pointer, :uint, :pointer ], :int
  attach_function :JS_SetUCProperty, [ :pointer, :pointer, :pointer, :uint, :pointer ], :int
  attach_function :JS_DeleteUCProperty2, [ :pointer, :pointer, :pointer, :uint, :pointer ], :int
  attach_function :JS_NewArrayObject, [ :pointer, :int, :pointer ], :pointer
  attach_function :JS_IsArrayObject, [ :pointer, :pointer ], :int
  attach_function :JS_GetArrayLength, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_SetArrayLength, [ :pointer, :pointer, :uint ], :int
  attach_function :JS_HasArrayLength, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_DefineElement, [ :pointer, :pointer, :int, :long, :JSPropertyOp, :JSPropertyOp, :uint ], :int
  attach_function :JS_AliasElement, [ :pointer, :pointer, :string, :int ], :int
  attach_function :JS_HasElement, [ :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_LookupElement, [ :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_GetElement, [ :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_SetElement, [ :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_DeleteElement, [ :pointer, :pointer, :int ], :int
  attach_function :JS_DeleteElement2, [ :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_ClearScope, [ :pointer, :pointer ], :void
  attach_function :JS_Enumerate, [ :pointer, :pointer ], :pointer
  attach_function :JS_NewPropertyIterator, [ :pointer, :pointer ], :pointer
  attach_function :JS_NextProperty, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_CheckAccess, [ :pointer, :pointer, :long, :int, :pointer, :pointer ], :int
  attach_function :JS_SetCheckObjectAccessCallback, [ :pointer, :JSCheckAccessOp ], :JSCheckAccessOp
  attach_function :JS_GetReservedSlot, [ :pointer, :pointer, :uint, :pointer ], :int
  attach_function :JS_SetReservedSlot, [ :pointer, :pointer, :uint, :long ], :int
  # FIXME: should support inlined callbacks in structs
  callback(:getPrincipalArray, [ :pointer, :pointer ], :pointer)
  callback(:globalPrivilegesEnabled, [ :pointer, :pointer ], :int)
  callback(:destroy, [ :pointer, :pointer ], :void)
  callback(:subsume, [ :pointer, :pointer ], :int)
  class JSPrincipals < FFI::Struct
    layout(
           :codebase, :string,
           :getPrincipalArray, :getPrincipalArray,
           :globalPrivilegesEnabled, :globalPrivilegesEnabled,
           :refcount, :int,
           :destroy, :destroy,
           :subsume, :subsume
    )
  end
  attach_function :JS_SetPrincipalsTranscoder, [ :pointer, :JSPrincipalsTranscoder ], :JSPrincipalsTranscoder
  attach_function :JS_SetObjectPrincipalsFinder, [ :pointer, :JSObjectPrincipalsFinder ], :JSObjectPrincipalsFinder
  attach_function :JS_NewFunction, [ :pointer, :JSNative, :uint, :uint, :pointer, :string ], :pointer
  attach_function :JS_GetFunctionObject, [ :pointer ], :pointer
  attach_function :JS_GetFunctionName, [ :pointer ], :string
  attach_function :JS_GetFunctionId, [ :pointer ], :pointer
  attach_function :JS_GetFunctionFlags, [ :pointer ], :uint
  attach_function :JS_GetFunctionArity, [ :pointer ], :ushort
  attach_function :JS_ObjectIsFunction, [ :pointer, :pointer ], :int
  attach_function :JS_DefineFunctions, [ :pointer, :pointer, :pointer ], :int
  attach_function :JS_DefineFunction, [ :pointer, :pointer, :string, :JSNative, :uint, :uint ], :pointer
  attach_function :JS_DefineUCFunction, [ :pointer, :pointer, :pointer, :uint, :JSNative, :uint, :uint ], :pointer
  attach_function :JS_CloneFunctionObject, [ :pointer, :pointer, :pointer ], :pointer
  attach_function :JS_BufferIsCompilableUnit, [ :pointer, :pointer, :string, :uint ], :int
  attach_function :JS_CompileScript, [ :pointer, :pointer, :string, :uint, :string, :uint ], :pointer
  attach_function :JS_CompileScriptForPrincipals, [ :pointer, :pointer, :pointer, :string, :uint, :string, :uint ], :pointer
  attach_function :JS_CompileUCScript, [ :pointer, :pointer, :pointer, :uint, :string, :uint ], :pointer
  attach_function :JS_CompileUCScriptForPrincipals, [ :pointer, :pointer, :pointer, :pointer, :uint, :string, :uint ], :pointer
  attach_function :JS_CompileFile, [ :pointer, :pointer, :string ], :pointer
  attach_function :JS_CompileFileHandle, [ :pointer, :pointer, :string, :pointer ], :pointer
  attach_function :JS_CompileFileHandleForPrincipals, [ :pointer, :pointer, :string, :pointer, :pointer ], :pointer
  attach_function :JS_NewScriptObject, [ :pointer, :pointer ], :pointer
  attach_function :JS_GetScriptObject, [ :pointer ], :pointer
  attach_function :JS_DestroyScript, [ :pointer, :pointer ], :void
  attach_function :JS_CompileFunction, [ :pointer, :pointer, :string, :uint, :pointer, :string, :uint, :string, :uint ], :pointer
  attach_function :JS_CompileFunctionForPrincipals, [ :pointer, :pointer, :pointer, :string, :uint, :pointer, :string, :uint, :string, :uint ], :pointer
  attach_function :JS_CompileUCFunction, [ :pointer, :pointer, :string, :uint, :pointer, :pointer, :uint, :string, :uint ], :pointer
  attach_function :JS_CompileUCFunctionForPrincipals, [ :pointer, :pointer, :pointer, :string, :uint, :pointer, :pointer, :uint, :string, :uint ], :pointer
  attach_function :JS_DecompileScript, [ :pointer, :pointer, :string, :uint ], :pointer
  attach_function :JS_DecompileFunction, [ :pointer, :pointer, :uint ], :pointer
  attach_function :JS_DecompileFunctionBody, [ :pointer, :pointer, :uint ], :pointer
  attach_function :JS_ExecuteScript, [ :pointer, :pointer, :pointer, :pointer ], :int
  JSEXEC_PROLOG = 0
  JSEXEC_MAIN = 1

  attach_function :JS_ExecuteScriptPart, [ :pointer, :pointer, :pointer, :int, :pointer ], :int
  attach_function :JS_EvaluateScript, [ :pointer, :pointer, :string, :uint, :string, :uint, :pointer ], :int
  attach_function :JS_EvaluateScriptForPrincipals, [ :pointer, :pointer, :pointer, :string, :uint, :string, :uint, :pointer ], :int
  attach_function :JS_EvaluateUCScript, [ :pointer, :pointer, :pointer, :uint, :string, :uint, :pointer ], :int
  attach_function :JS_EvaluateUCScriptForPrincipals, [ :pointer, :pointer, :pointer, :pointer, :uint, :string, :uint, :pointer ], :int
  attach_function :JS_CallFunction, [ :pointer, :pointer, :pointer, :uint, :pointer, :pointer ], :int
  attach_function :JS_CallFunctionName, [ :pointer, :pointer, :string, :uint, :pointer, :pointer ], :int
  attach_function :JS_CallFunctionValue, [ :pointer, :pointer, :long, :uint, :pointer, :pointer ], :int
  attach_function :JS_SetBranchCallback, [ :pointer, :JSBranchCallback ], :JSBranchCallback
  attach_function :JS_IsRunning, [ :pointer ], :int
  attach_function :JS_IsConstructing, [ :pointer ], :int
  attach_function :JS_IsAssigning, [ :pointer ], :int
  attach_function :JS_SetCallReturnValue2, [ :pointer, :long ], :void
  attach_function :JS_SaveFrameChain, [ :pointer ], :pointer
  attach_function :JS_RestoreFrameChain, [ :pointer, :pointer ], :void
  attach_function :JS_NewString, [ :pointer, :string, :uint ], :pointer
  attach_function :JS_NewStringCopyN, [ :pointer, :string, :uint ], :pointer
  attach_function :JS_NewStringCopyZ, [ :pointer, :string ], :pointer
  attach_function :JS_InternString, [ :pointer, :string ], :pointer
  attach_function :JS_NewUCString, [ :pointer, :pointer, :uint ], :pointer
  attach_function :JS_NewUCStringCopyN, [ :pointer, :pointer, :uint ], :pointer
  attach_function :JS_NewUCStringCopyZ, [ :pointer, :pointer ], :pointer
  attach_function :JS_InternUCStringN, [ :pointer, :pointer, :uint ], :pointer
  attach_function :JS_InternUCString, [ :pointer, :pointer ], :pointer
  attach_function :JS_GetStringBytes, [ :pointer ], :string
  attach_function :JS_GetStringChars, [ :pointer ], :pointer
  attach_function :JS_GetStringLength, [ :pointer ], :uint
  attach_function :JS_CompareStrings, [ :pointer, :pointer ], :int
  attach_function :JS_NewGrowableString, [ :pointer, :pointer, :uint ], :pointer
  attach_function :JS_NewDependentString, [ :pointer, :pointer, :uint, :uint ], :pointer
  attach_function :JS_ConcatStrings, [ :pointer, :pointer, :pointer ], :pointer
  attach_function :JS_UndependString, [ :pointer, :pointer ], :pointer
  attach_function :JS_MakeStringImmutable, [ :pointer, :pointer ], :int
  attach_function :JS_CStringsAreUTF8, [  ], :int
  attach_function :JS_EncodeCharacters, [ :pointer, :pointer, :uint, :string, :pointer ], :int
  attach_function :JS_DecodeBytes, [ :pointer, :string, :uint, :pointer, :pointer ], :int
  class JSLocaleCallbacks < FFI::Struct
    layout(
           :localeToUpperCase, :JSLocaleToUpperCase,
           :localeToLowerCase, :JSLocaleToLowerCase,
           :localeCompare, :JSLocaleCompare,
           :localeToUnicode, :JSLocaleToUnicode,
           :localeGetErrorMessage, :JSErrorCallback
    )
  end
  attach_function :JS_SetLocaleCallbacks, [ :pointer, :pointer ], :void
  attach_function :JS_GetLocaleCallbacks, [ :pointer ], :pointer
  attach_function :JS_ReportError, [ :pointer, :string, :varargs ], :void
  attach_function :JS_ReportErrorNumber, [ :pointer, :JSErrorCallback, :pointer, :uint, :varargs ], :void
  attach_function :JS_ReportErrorNumberUC, [ :pointer, :JSErrorCallback, :pointer, :uint, :varargs ], :void
  attach_function :JS_ReportWarning, [ :pointer, :string, :varargs ], :int
  attach_function :JS_ReportErrorFlagsAndNumber, [ :pointer, :uint, :JSErrorCallback, :pointer, :uint, :varargs ], :int
  attach_function :JS_ReportErrorFlagsAndNumberUC, [ :pointer, :uint, :JSErrorCallback, :pointer, :uint, :varargs ], :int
  attach_function :JS_ReportOutOfMemory, [ :pointer ], :void
  class JSErrorReport < FFI::Struct
    layout(
           :filename, :string,
           :lineno, :uint,
           :linebuf, :string,
           :tokenptr, :string,
           :uclinebuf, :pointer,
           :uctokenptr, :pointer,
           :flags, :uint,
           :errorNumber, :uint,
           :ucmessage, :pointer,
           :messageArgs, :pointer
    )
  end
  JSREPORT_ERROR = 0x0
  JSREPORT_WARNING = 0x1
  JSREPORT_EXCEPTION = 0x2
  JSREPORT_STRICT = 0x4
  attach_function :JS_SetErrorReporter, [ :pointer, :JSErrorReporter ], :JSErrorReporter
  JSREG_FOLD = 0x01
  JSREG_GLOB = 0x02
  JSREG_MULTILINE = 0x04
  attach_function :JS_NewRegExpObject, [ :pointer, :string, :uint, :uint ], :pointer
  attach_function :JS_NewUCRegExpObject, [ :pointer, :pointer, :uint, :uint ], :pointer
  attach_function :JS_SetRegExpInput, [ :pointer, :pointer, :int ], :void
  attach_function :JS_ClearRegExpStatics, [ :pointer ], :void
  attach_function :JS_ClearRegExpRoots, [ :pointer ], :void
  attach_function :JS_IsExceptionPending, [ :pointer ], :int
  attach_function :JS_GetPendingException, [ :pointer, :pointer ], :int
  attach_function :JS_SetPendingException, [ :pointer, :long ], :void
  attach_function :JS_ClearPendingException, [ :pointer ], :void
  attach_function :JS_ReportPendingException, [ :pointer ], :int
  attach_function :JS_SaveExceptionState, [ :pointer ], :pointer
  attach_function :JS_RestoreExceptionState, [ :pointer, :pointer ], :void
  attach_function :JS_DropExceptionState, [ :pointer, :pointer ], :void
  attach_function :JS_ErrorFromException, [ :pointer, :long ], :pointer
  attach_function :JS_ThrowReportedError, [ :pointer, :string, :pointer ], :int

  #FIXME: this should be in a helper module
  def self.js_bit(n)       
    1 << n
  end

  JSOPTION_VAROBJFIX = js_bit(2)

end
