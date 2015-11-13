require 'spec_helper'

describe CrabCanon do
  describe '#check' do
    it 'can read a crab canon file in and determine that it is a crab cannon' do
      expect(CrabCanon.check(abs_path('../../debug1/input'))).to eq ['yes']
    end

    it 'can read a non-crab canon file in and determine that it isnt a crab canon' do
      expect(CrabCanon.check(abs_path('../../debug2/input'))).to eq ['no', 'yes']
    end
  end
end

describe MusicFileParser do
  describe '#parse' do
    it 'can take a file location and return an even number of MusicObjects' do
      music_object_array = MusicFileParser.parse(abs_path('../../debug1/input'))
      music_object_array.each do |music_object|
        expect(music_object).to be_a MusicObject
      end
    end
  end
end

def abs_path(relative_path)
  File.expand_path(relative_path, __FILE__)
end
