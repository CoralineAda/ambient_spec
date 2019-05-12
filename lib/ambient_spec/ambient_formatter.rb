RSpec::Support.require_rspec_core "formatters/base_text_formatter"
RSpec::Support.require_rspec_core "formatters/console_codes"

module RSpec
  module Core
    module Formatters

      class AmbientFormatter < BaseTextFormatter

        Formatters.register self, :example_passed, :example_failed

        def example_passed(_)
          player.sing(:pass)
          super
        end

        def example_failed(_)
          player.sing(:fail)
          super
        end

        private

        def player
          @player ||= AmbientSpec::Player.new
        end

      end
    end
  end
end
