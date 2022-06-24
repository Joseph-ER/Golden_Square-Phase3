require 'music_library'

describe "music_library.rb " do
  it "adds and lists 2 tracks successfully" do
    library = MusicLibrary.new
    track1 = double :fakeTrack
    track2 = double :fakeTrack
    library.add(track1)
    library.add(track2)
    expect(library.all).to eq [track1, track2]  
  end
  
  it "matches one of two songs added (returned in a list)" do
    library = MusicLibrary.new
    track1 = double :fakeTrack , matched?: true 
    track2 = double :fakeTrack , matched?: false
    library.add(track1)
    library.add(track2)
    expect(library.search("Sup")).to eq [track1]
  end

  it "returns an error when no tracks have been added " do
    library = MusicLibrary.new
    expect { library.all } .to raise_error "No tracks have been added"
  end

  it "returns an error when searching an empty list" do
    library = MusicLibrary.new
    expect { library.search("Hello") } .to raise_error "No tracks to search through"
  end

  it "returns an error when keyword is an empty string" do
    library = MusicLibrary.new
    track1 = double :fakeTrack , matched?: true 
    library.add(track1)
    expect { library.search("") } .to raise_error "Can't search for an empty string"
  end
end

# mocked_var = double :fake
# expect(fake).to receive(:method).with(Parameter/Parameters).and_return(Exepcted result)
# expect(fake.method(parameters)).to eq (Expected Result)
# eg
# maths = double :maths
# expect(maths).to recieve(:addition_method).with(1,2).and_return(3)
# expect(maths.addition_method(1,2)).to eq 3