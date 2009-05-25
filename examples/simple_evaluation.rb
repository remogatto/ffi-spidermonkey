$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "../lib")))
require 'ffi-spidermonkey'

include SpiderMonkey

@rt = Runtime.new

retval = @rt.evaluate("1 + 1")
puts "Result of evaluation is #{retval}"

## Proxies get reused

foo = @rt.evaluate('foo = { bar: 10 }')
@rt['same_foo'] = foo

puts @rt.evaluate('foo == same_foo')
