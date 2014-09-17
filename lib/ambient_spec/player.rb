require 'wavefile'

module AmbientSpec

  class Player

    attr_accessor :counter

    def note_to_frequency(interval)
      return 220 * (1.059463094359**interval)
    end

    def song_2
      [1, 3, 5, 7, 9, 12]
    end

    def song
      [
        1, 1, 1, 1,
        1, 1, 1, 1,
        1, 1, 1, 1,
        1, 1, 1, 1,
        1, 1, 1, 1,
        5 % 12,
        10 % 12,
        15 % 12,
        20 % 12,
        25 % 12,
        30 % 12
      ]
    end

    def fifths
     ["c", "g", "d", "a", "e", "b", "f"]#, "f_sharp", "c_sharp", "a_flat", "e_flat", "b_flat", "f"]
    end

    def fifths_temp
      ["pass_1", "pass_1", "pass_1", "pass_1", "pass_1", "pass_2", "pass_3", "pass_3"]
    end

    OUTPUT_FILENAME = "tmp/test.wav"
    SAMPLE_RATE = 44100
    TWO_PI = 2 * Math::PI
    RANDOM_GENERATOR = Random.new

    def sing(status=:pass)
      increment_counter
      return unless counter % 10 == 1 || status == :fail
      if status == :pass
        folder = ["rain", "rain", "rain_2", "drip"].sample
      else
        folder = "gong"
      end
      filename = fifths.sample
      system("afplay ambient_spec/sounds/#{folder}/#{filename}.wav &")
    end

    def increment_counter
      self.counter ||= 0; self.counter += 1
    end

    def chime(status=:pass, duration=1)
      increment_counter
      return unless counter % 2 == 0

      wave_type = status == :pass ? :square : :noise
      max_amplitude = (5..10).to_a.sample * 0.1

      sample_count = 44100 * duration.to_i / 5
      samples = duration.to_i.times.map do |i|
        frequency = note_to_frequency(song.sample)
        generate_sample_data(wave_type, sample_count, frequency, max_amplitude)
      end.flatten

      buffer = WaveFile::Buffer.new(samples, WaveFile::Format.new(:mono, :float, 44100))
      WaveFile::Writer.new(OUTPUT_FILENAME, WaveFile::Format.new(:mono, :pcm_16, 44100)) do |writer|
        writer.write(buffer)
      end
      system("afplay #{OUTPUT_FILENAME} &")
    end

    # The dark heart of NanoSynth, the part that actually generates the audio data
    def generate_sample_data(wave_type, num_samples, frequency, max_amplitude)
      position_in_period = 0.0
      position_in_period_delta = frequency / SAMPLE_RATE

      # Initialize an array of samples set to 0.0. Each sample will be replaced with
      # an actual value below.
      samples = [].fill(0.0, 0, num_samples)

      num_samples.times do |i|
        # Add next sample to sample list. The sample value is determined by
        # plugging position_in_period into the appropriate wave function.
        if wave_type == :sine
          samples[i] = Math::sin(position_in_period * TWO_PI) * max_amplitude
        elsif wave_type == :square
          samples[i] = (position_in_period >= 0.5) ? max_amplitude : -max_amplitude
        elsif wave_type == :saw
          samples[i] = ((position_in_period * 2.0) - 1.0) * max_amplitude
        elsif wave_type == :triangle
          samples[i] = max_amplitude - (((position_in_period * 2.0) - 1.0) * max_amplitude * 2.0).abs
        elsif wave_type == :noise
          samples[i] = RANDOM_GENERATOR.rand(-max_amplitude..max_amplitude)
        end

        position_in_period += position_in_period_delta

        # Constrain the period between 0.0 and 1.0.
        # That is, keep looping and re-looping over the same period.
        if(position_in_period >= 1.0)
          position_in_period -= 1.0
        end
      end

      samples
    end

  end
end