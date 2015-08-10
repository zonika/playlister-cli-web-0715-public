class Artist
  # code here
  attr_accessor :name, :songs, :genres
  @@all_artists = []
  def initialize
    @@all_artists << self
    @songs = []
    @genres = []
  end
  def add_song(song)
    @songs << song
    @genres << song.genre
    if song.genre != nil
      song.genre.artists << self if !song.genre.artists.include? self
    end
  end
  def add_songs(songs)
    songs.each do |song|
      @songs << song
      @genres << song.genre
      if song.genre != nil
        song.genre.artists << self
      end
    end
  end
  def self.reset_all
    @@all_artists=[]
  end
  def self.all
    @@all_artists
  end
  def self.count
    @@all_artists.size
  end
  def self.find_by_name(name)
    found = @@all_artists.find {
      |song|
      song.name=name
    }
  end
  def self.create_by_name(name)
    a=self.new
    a.name=name
    a
  end
end
