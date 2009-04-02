require 'rubygems'

begin
  require 'ffi-swig-generator'
  FFI::Generator::Task.new :input_fn => 'interfaces/*.i', :output_dir => 'generated/'
rescue LoadError
  nil
end

desc "Display FIXME"
task :fixme do
  Dir.glob('**/*.rb').each do |fn|
    File.read(fn).scan(/FIXME:(.*?)$/m).each do |fixme|
      puts "FIXME: #{fixme} ...- '#{fn}'"
    end
  end
end
