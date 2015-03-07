module Minitest
  def self.plugin_ambient_init options
    self.reporter << AmbientReporter.new
  end
end

class AmbientReporter < Minitest::Reporter
  def record result
    player = AmbientSpec::Player.new
    player.sing(result)
  end
end
