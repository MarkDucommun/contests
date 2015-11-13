class CrabCanon
  class << self
    def check(file)
      music_objects = MusicFileParser.parse(file)
      return 'MALFORMED FILE' unless music_objects.length % 2 == 0
      music_objects.each_slice(2).map do |music_object_pair|
        music_object_pair.first == music_object_pair.last.reverse ? 'yes' : 'no'
      end
    end
  end
end

class MusicFileParser
  class << self
    def parse(file_location)
      raw_array = read_file(file_location)
      convert_into_music_object(raw_array)
    end

    def read_file(file_location)
      File.readlines(file_location)
    end

    def convert_into_music_object(raw_array)
      raw_array.each_slice(12).map do |raw_music_object|
        MusicObjectParser.parse(raw_music_object)
      end
    end
  end
end

class MusicObjectParser
  class << self
    def parse(raw_music_object)
      raw_music_object.pop if raw_music_object.length == 12
      fail 'MALFORMED STAFF' if invalid_staff_length(raw_music_object)
      music_object = MusicObject.new
      raw_music_object.each_with_index do |line, index|
        add_line_to_music_object(music_object, line, index)
      end
      music_object
    end

    def add_line_to_music_object(music_object, line)

    def invalid_staff_length(raw_music_object)
      sorted_lengths = raw_music_object.map.length(&:length).sort
      sorted_length[0] != sorted_length[-1]
    end
  end
end

class MusicObject
end

class Measure
  attr_accessor note_hash

  def initialize
    self.note_hash = {}
  end

  def add_note(value, index)
    note_hash[index] = value
  end

  def ==(other_measure)
    self.note_hash == other_measure.note_hash
  end
end
