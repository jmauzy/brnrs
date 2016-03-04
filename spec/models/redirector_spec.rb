require "rails_helper"
require "support/link_helper"

describe "Redirector" do
  it "finds a record with a hash matching the first parameter" do

    expect(Link).to receive(:find_by!).with(url_hash: "test")

    Redirector.new("test")
  end

  it "raises an exception if record is not found" do

    expect {Redirector.new("missing link")}.to raise_error(ActiveRecord::RecordNotFound)
  end
end


describe "#target_url" do
  include LinkHelper

  it "finds a link by url_hash and returns the url" do

    link = generate_link
    url_hash = link.url_hash
    allow(Link).to receive(:find_by!).with(url_hash: url_hash).and_return(link)

    redirector = Redirector.new(url_hash)

    expect(redirector.target_url).to eq(link.url)
  end
  
end
