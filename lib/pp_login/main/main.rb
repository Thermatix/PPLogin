require "pathname"
dire_path = File.dirname(Pathname.new(__FILE__).realpath) + "/modules/*.rb"
Dir[dire_path].each {|file| require file }