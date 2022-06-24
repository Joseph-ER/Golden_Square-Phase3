require 'secret_diary'
require 'diary'

describe "secret_diary_integration" do
  it "unlock method is succesful " do
    diary = Diary.new("Diary contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq (diary.contents)
  end

  it "lock method successful " do
    diary = Diary.new("Diary contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end