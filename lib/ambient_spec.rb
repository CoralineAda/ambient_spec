if defined?(RSpec)
  require "rspec/core"
end

require "ambient_spec/version"
require "ambient_spec/player"
require "ambient_spec/configure"

module AmbientSpec
  unless ENV['AMBIENT_SPEC_DISABLE']
    if defined?(RSpec)
      AmbientSpec::Configure.new.rspec
    end
  end

  # IDEAL
  # else
  #   AmbientSpec::Configure.new.minitest
  # end

end
