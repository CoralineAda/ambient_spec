if defined?(RSpec)
  require "rspec/core"
else
  require "minitest/spec"
end

require "ambient_spec/version"
require "ambient_spec/player"
require "ambient_spec/configure"

module AmbientSpec

  unless ENV['AMBIENT_SPEC_DISABLED']

    if defined?(RSpec)
      AmbientSpec::Configure.new.rspec
#    else
#      AmbientSpec::Configure.new.minitest
    end

  end

end
