require 'catfacts'

RSpec.describe CatFacts do
  it "tests for 1 cat fact" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://catfact.ninja/fact")).and_return('{"fact":"The Egyptian Mau is probably the oldest breed of cat. In fact, the breed is so ancient that its name is the Egyptian word for \u201ccat.\u201d","length":132}')
      catfacts = CatFacts.new(fake_requester)
      fact = ("Cat fact: The Egyptian Mau is probably the oldest breed of cat. In fact, the breed is so ancient that its name is the Egyptian word for \u201ccat.\u201d")
      expect(catfacts.provide).to eq fact
  end
end