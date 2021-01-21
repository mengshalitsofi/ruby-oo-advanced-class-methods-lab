class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if (song == nil)
      song = Song.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    Song.all.sort{|song1, song2| song1.name <=> song2.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    name = parts[1][0..parts[1].length - 5]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    Song.all.clear
  end

end
