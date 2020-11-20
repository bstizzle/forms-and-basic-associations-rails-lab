class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(n)
    self.artist = Artist.find_or_create_by(name: n)
  end 

  def artist_name
    if self.artist
      self.artist.name
    end 
  end

  def genre_name=(n)
    self.genre = Genre.find_or_create_by(name: n)
  end 

  def genre_name
    if self.genre
      self.genre.name
    end 
  end

  def note_contents=(contents)
    contents.each do |cont|
      if cont != ""
        self.notes.build(content: cont)
      end
    end
  end 

  def note_contents
    self.notes.map{ |note| note.content}
  end
end
