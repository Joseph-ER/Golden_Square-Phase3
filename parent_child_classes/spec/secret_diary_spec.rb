require 'secret_diary'

describe SecretDiary do
  it " unlock method" do
    fake_diary = double :fake_diary, contents: "FAKE CONTENTS"
    secret_diary = SecretDiary.new(fake_diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq (fake_diary.contents)
  end

  it "lock method " do
    fake_diary = double :fake_diary, contents: "FAKE CONTENTS"
    secret_diary = SecretDiary.new(fake_diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read } .to raise_error "Go away!"
  end
end