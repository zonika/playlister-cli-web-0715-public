require 'pry'
class LibraryParser
  # code here
  attr_accessor :files
  def initialize
    @files = Dir.entries('db/data').drop(2)
  end
  def parse_filename(filename)
    arr=filename.split(/\-(.*)\[(.*)\]/)
    arr.each do |piece|
      piece.strip!
    end
    arr.pop
    arr
  end
  def build_song(a,s,g)
    song=Song.create_by_name(s)
    artist=Artist.create_by_name(a)
    genre=Genre.create_by_name(g)
    song.genre=genre
    song.artist=artist
    artist.add_song(song)
    song
  end
  def call
    @files.each do |file|
      a=parse_filename(file)
      build_song(a[0],a[1],a[2])
    end
  end
end

LibraryParser.new  # => #<LibraryParser:0x007f8373849718>
