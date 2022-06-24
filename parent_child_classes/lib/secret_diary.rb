class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @locked = true
  end

  def read
    return @diary.contents if @locked == false
    fail "Go away!" if @locked == true
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end