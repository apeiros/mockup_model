# encoding: utf-8

begin
  require 'rubygems/version' # newer rubygems use this
rescue LoadError
  require 'gem/version' # older rubygems use this
end

class PseudoModel

  # The version of the PseudoModel gem
  Version = Gem::Version.new("0.0.1")
end
