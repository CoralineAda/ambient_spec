require "rspec/core"
require "ambient_spec/version"
require "ambient_spec/player"
require "ambient_spec/configure"

module AmbientSpec
  unless ENV['AMBIENT_SPEC_DISABLED']
    AmbientSpec::Configure.new.rspec
  end
end
