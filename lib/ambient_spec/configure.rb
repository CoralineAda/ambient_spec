if defined?(RSpec)
  require "rspec/core"
end

module AmbientSpec

  class Configure

    def rspec
      ::RSpec.configure do |config|
        player = AmbientSpec::Player.new
        config.after(:each) do |example|
          flag = example.exception ? :fail : :pass
          player.sing(flag)
        end
      end
    end

  end

end
