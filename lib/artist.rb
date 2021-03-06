class Artist
  attr_accessor :name, :songs
  
  extend Concerns::Findable 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
    @@all = []
  end
  
  def self.create(name)
    new_artist = Artist.new(name) 
    new_artist.save
    new_artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist 
    @songs << song unless @songs.include?(song)
  end
    
  def genres 
    @songs.collect do |song|
      song.genre 
    end.uniq 
  end

end

