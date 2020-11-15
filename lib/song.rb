require "pry"
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
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      return Song.create_by_name(name)
    end
    return Song.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|song_1, song_2| song_1.name <=> song_2.name}
  end

  def self.new_from_filename(full_song)
    regex = full_song.scan(/(^[a-z ]+?)[\s-]+([a-z ]+?)\./i)
    song = self.new
    song.name = regex[0][1]
    song.artist_name = regex[0][0]
    return song
  end

  def self.create_from_filename(full_song)
    regex = full_song.scan(/(^[a-z ]+?)[\s-]+([a-z ]+?)\./i)
    song = self.create
    song.name = regex[0][1]
    song.artist_name = regex[0][0]
    return song
  end

  def self.destroy_all
    @@all = []
  end
end
