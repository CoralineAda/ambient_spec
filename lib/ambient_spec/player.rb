require 'wavefile'

module AmbientSpec

  class Player

    attr_accessor :counter

    def fifths
      ["c", "g", "d", "a", "e", "b", "f"]
    end

    def sing(status=:pass)
      increment_counter
      return unless counter % 10 == 1 || status == :fail
      if status == :pass
        folder = ["rain", "rain", "rain_2", "drip"].sample
      else
        folder = "gong"
      end
      filename = fifths.sample
      system("afplay #{path_to_files}/#{folder}/#{filename}.wav &")
    end

    def increment_counter
      self.counter ||= 0; self.counter += 1
    end

    def path_to_files
      @path_to_files ||= File.join(File.dirname(File.expand_path(__FILE__)), 'sounds')
    end

  end
end