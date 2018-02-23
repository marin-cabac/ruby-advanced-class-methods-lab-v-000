class Song
  attr_accessor :name, :artist_name
  @@all = []
 #######################################
  def self.create
    s=self.new
    s.save
    s
  end
 #######################################
  def self.all
    @@all
  end
  #######################################
  def self.new_by_name(name_of_s)
   s=self.new
   s.name=name_of_s
   s
  end
  #######################################
  def save
    self.class.all << self
  end
  #######################################
  def self.create_by_name(name_of_s)
   s=self.new_by_name(name_of_s)
   s.save
   s
 end
  #######################################
  def self.find_by_name(s)
  @@all.find{|x|x.name==s}
end
  #######################################
  def self.find_or_create_by_name(s)
    obj=self.find_by_name(s)
    obj ? obj : self.create_by_name(s)
  end

  #######################################
  def self.alphabetical
    @@all.sort_by(& :name)
  ##  @@all.sort! { |a, b|  a.name <=> b.name }
   end
  #######################################
  def self.create_from_filename(mp3_formatted_file)
      # Build a class constructor that accepts a filename in the 
      # format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
      
      # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), 
      # the constructor should return a new Song instance with the song 
      # name set to Blank Space and the artist_name set to Taylor Swift.
      c = self.new 
      c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
      c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
      c.save
      c
    end 

=begin
  def self.new_from_filename(file_n)
   v=file_n.split(/\.|-/)
   new_o = self.create
   new_o.name = v[1]
   new_o.artist_name = v[0]
    #v="Thundercat - For Love I Come.mp3".split(/\.|-/)
  end
=end 
  #######################################
end
