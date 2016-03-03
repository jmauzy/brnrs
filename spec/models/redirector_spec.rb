require "rails_helper"
require "support/link_helper"

describe "#target_url" do
  include LinkHelper

  it "finds a link by url_hash and returns the url" do
    link = generate_link
    url_hash = link.url_hash
    allow(Link).to receive(:find_by).with(url_hash: url_hash).and_return(link)

    redirector = Redirector.new(url_hash)

    expect(redirector.target_url).to eq(link.url)
  end
  
end
