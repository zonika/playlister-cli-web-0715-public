require 'pry'
class Song
  # code here
  attr_accessor :name, :genre, :artist
  @@all_songs=[]
  def initialize
    @@all_songs << self
  end
  def genre=genre
    @genre=genre
    genre.songs << self
  end
  def self.create_by_name(n)
    s=self.new
    s.name=n
    s
  end
  def self.find_by_name(name)
    found = @@all_songs.find {
      |song|
      song.name=name
    }
  end
  def self.reset_all
    @@all_songs=[]
  end
  def self.count
    @@all_songs.size
  end
  def self.all
    @@all_songs
  end
  def to_s
    "#{@artist.name} - #{@name} [#{@genre.name}]"
  end
end
