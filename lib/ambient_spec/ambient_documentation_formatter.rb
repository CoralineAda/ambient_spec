require "rspec/core/formatters/base_text_formatter"

class AmbientDocumentationFormatter < RSpec::Core::Formatters::DocumentationFormatter

  RSpec::Core::Formatters.register self, :example_passed, :example_failed

  def example_started
    @start_time = Time.now
  end

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
