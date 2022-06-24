class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track)
    @tracks.push(track)
  end

  def all
    fail "No tracks have been added" if @tracks.empty?
    @tracks
  end

  def search(keyword)
    fail "No tracks to search through" if @tracks.empty?
    fail "Can't search for an empty string" if keyword == ""
    @tracks.select {|track| track.matched?(keyword)}
  end
end
