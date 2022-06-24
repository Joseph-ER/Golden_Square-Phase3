require 'API_exercise'

RSpec.describe TimeError do
  it "returns the difference between the remote clock and the local clock" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return('{"abbreviation":"BST","client_ip":"51.6.165.18","datetime":"2022-06-24T10:35:20.291473+01:00","day_of_week":5,"day_of_year":175,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1656063320,"utc_datetime":"2022-06-24T09:35:20.291473+00:00","utc_offset":"+01:00","week_number":25}')
    time = Time.new(2022, 6, 24, 10, 35, 20)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq 0.291473
  end
end