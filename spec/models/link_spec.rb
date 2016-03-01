require "rails_helper"
require "support/link_helper"

describe Link do
  include LinkHelper
  it "requires a url to be valid" do
    link = generate_link
    expect(link).to be_valid

    link.url = nil
    expect(link).to_not be_valid
  end

  it "assigns an 8 digit random string to url_hash on creation" do
    link1  = generate_link
    link2  = generate_link
    
    expect(link1.url_hash).to_not eq(nil)
    expect(link1.url_hash.length).to eq(8)
    expect(link1.url_hash).to_not eq(link2.url_hash)
  end




end


