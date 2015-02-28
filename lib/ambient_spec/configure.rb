if defined?(RSpec)
  require "rspec/core"
else
  require "minitest/spec"
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

    def minitest
      ::Minitest::Spec.after :each do |example|
        player = AmbientSpec::Player.new 
        flag = !example.passed? ? :fail : :pass
        player.sing(flag)
      end    
    end

  end

end
