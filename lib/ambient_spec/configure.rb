require "rspec/core"

module AmbientSpec

  class Configure

    def rspec
      ::RSpec.configure do |config|
        player = AmbientSpec::Player.new
        config.after(:each) do |example|
          duration = Time.now - example.metadata[:execution_result].started_at
          duration = [duration * 100, 1].min
          flag = example.exception ? :fail : :pass
          player.sing(flag)
        end
      end
    end

  end

end