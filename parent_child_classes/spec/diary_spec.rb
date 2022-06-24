require 'diary'

describe Diary do
  it "constructs" do
    diary = Diary.new("This is contents")
    expect(diary.contents).to eq "This is contents"
  end
end