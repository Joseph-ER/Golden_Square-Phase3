require 'music_library'
require 'track'

describe "integration " do
  it "adds and lists multiple tracks " do
    library = MusicLibrary.new
    track1 = Track.new("MF DOOM", "Super")
    track2 = Track.new("Freddy Gibbs", "Thuggin")
    library.add(track1)
    library.add(track2)
    expect(library.all).to eq [track1, track2]
  end

  it "lists tracks that match the keyword" do
    library = MusicLibrary.new
    track1 = Track.new("MF DOOM", "Super")
    track2 = Track.new("Freddy Gibbs", "Thuggin")
    library.add(track1)
    library.add(track2)
    expect(library.search("Sup")).to eq [track1]
  end

  it "returns an empty list when no matches to keyword" do
    library = MusicLibrary.new
    track1 = Track.new("Freddy Gibbs","Thuggin")
    library.add(track1)
    expect(library.search("hello")).to eq []
  end
end