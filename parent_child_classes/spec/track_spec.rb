require 'track'

describe "track" do
  it "constructs " do
    expect {Track.new("artist","song")}.not_to raise_error
  end

  it "correctly matches song to keyword" do
    track1 = Track.new("artist", "really nice song")
    expect(track1.matched?("song")).to eq true
    expect(track1.matched?("hello")).to eq false
  end
end