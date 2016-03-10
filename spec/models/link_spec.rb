require "rails_helper"

describe Link do
  before(:all) do
    @link = build(:link)
  end

  it "requires a url to be valid" do
    expect(@link).to be_valid

    @link.url = nil
    expect(@link).to_not be_valid
  end

  it "has a max_redirects which defaults to 0" do

    expect(@link.max_redirects).to eq(0)
  end

  it "has a redirects which initializes at 0" do

    expect(@link.redirects).to eq(0)
  end

  it "has an expiration which defaults to 1 year from the time of creation" do

    expect(@link.expiration.to_i).to eq(Time.now.next_year.round(0).to_i)
  end


  it "assigns an 8 digit random string to url_string on creation" do
    another_link = build(:link)
    
    expect(@link.url_string).to_not eq(nil)
    expect(@link.url_string.length).to eq(8)
    expect(@link.url_string).to_not eq(another_link.url_string)
  end

end

describe "#is_active?" do
  it "returns true when link is active" do
    link = build(:link)
    
    expect(link.is_active?).to be true
  end

  it "returns false when redirects reaches max_redirects" do
    link = build(:redirect_expired_link)

    expect(link.is_active?).to be false
  end

  it "returns false when expiration has passed" do
    link = build(:time_expired_link)

    expect(link.is_active?).to be false
  end
end
