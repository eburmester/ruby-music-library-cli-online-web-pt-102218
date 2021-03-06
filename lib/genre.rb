class Genre
  attr_accessor :name
  
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
    new_genre = Genre.new(name) 
    new_genre.save
    new_genre
  end
  
  def songs
    @songs
  end
  
  def artists
    @songs.collect do |song|
      song.artist 
    end.uniq 
  end

end
