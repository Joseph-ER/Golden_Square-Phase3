class Track
  def initialize(artist,song)
    @artist = artist
    @song = song
  end

  def matched?(keyword)
    @artist.include?(keyword) || @song.include?(keyword) ? true : false
  end
end