require 'wavefile'

module AmbientSpec

  class Player

    FIFTHS = %w{c g d a e b f}.freeze
    PATCHES = %w{breathy dark ghost harp piano plasma swirl waves}.freeze
    PATH_TO_FILES = File.join(File.dirname(File.expand_path(__FILE__)), 'sounds').freeze

    def sing(status=:pass)
      if status == :pass
        return unless should_play?
        folder = PATCHES.sample
        filename = FIFTHS.sample
        system("afplay #{PATH_TO_FILES}/#{folder}/#{filename}.wav &>/dev/null &")
        increment_timer
      else
        system("afplay #{PATH_TO_FILES}/failure/failure.wav &>/dev/null &")
      end
    end

    private

    def should_play?
      @last_played_at.nil? || Time.now - @last_played_at > 1
    end

    def increment_timer
      @last_played_at = Time.now
    end

  end
end
