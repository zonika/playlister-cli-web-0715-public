require 'pry'
class Genre
  # code here
  attr_accessor :name, :songs, :artists
  @@all_genres=[]
  def initialize
    @@all_genres << self
    @songs = []
    @artists = []
  end
  def self.all
    @@all_genres
  end
  def self.count
    @@all_genres.size
  end
  def self.reset_all
    @@all_genres = []
  end
  def self.find_by_name(name)
    found = @@all_genres.find {
      |song|
      song.name=name
    }
  end
  def self.create_by_name(name)
    g=self.new
    g.name=name
    g
  end
end
