require 'pry'

class Genre
  attr_accessor :name
  @@all = []

  def all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_song(song_name, artist)
    Song.new(song_name, artist, self)
  end

  def songs
    Song.all.select do |song|
      song.genre == self
    end
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end
  end

end
