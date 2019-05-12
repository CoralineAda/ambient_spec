require 'wavefile'

module AmbientSpec

  class Player

    FIFTHS = %w{c g d a e b f}.freeze
#    PATCHES = %w{breathy dark ghost harp piano plasma swirl waves}.freeze
    PATCHES = %w{piano harp}.freeze

    def initialize
      @last_played_at = Time.now
    end

    def sing(status=:pass)
      if status == :pass
        return unless should_play?
        folder = PATCHES.sample
        filename = FIFTHS.sample
        system("afplay #{path_to_files}/#{folder}/#{filename}.wav &>/dev/null &")
        increment_timer
      else
        system("afplay #{path_to_files}/failure/failure.wav &>/dev/null &")
        increment_timer
      end
    end

    private

    def should_play?
      Time.now - @last_played_at > 2
    end

    def increment_timer
      @last_played_at = Time.now
    end

    def path_to_files
      @path_to_files ||= File.join(File.dirname(File.expand_path(__FILE__)), 'sounds')
    end

  end
end
