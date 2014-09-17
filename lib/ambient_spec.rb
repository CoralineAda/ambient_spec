require "rspec/core"
require "ambient_spec/version"
require "ambient_spec/player"
require "ambient_spec/configure"
#autoload :Configuration, "ambient_spec/configure"

module AmbientSpec
  AmbientSpec::Configure.new.rspec
end
