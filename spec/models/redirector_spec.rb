require "rails_helper"
require "support/link_helper"

describe "Redirector" do
  it "finds a record with a hash matching the first parameter" do

    expect(Link).to receive(:find_by).with(url_hash: "test")

    Redirector.new("test")
  end

  it "assigns @link to nil if record doesn't exist" do
    redirector = Redirector.new("missing link")

    expect(redirector.link).to be_nil
  end
end

describe "#process" do
  include LinkHelper

  it "returns the url of a valid link" do
    link = generate_valid_link
    allow(Link).to receive(:find_by).and_return(link)

    redirector = Redirector.new(link.url_hash)

    expect(redirector.process).to eq(link.url)
  end

  it "returns nil for a nonexistant link" do
    link = nil
    allow(Link).to receive(:find_by).and_return(link)

    redirector = Redirector.new("missing link")

    expect(redirector.process).to eq(nil)
  end

  it "returns nil for an inactive link" do
    link = generate_time_expired_link
    allow(Link).to receive(:find_by).and_return(link)

    redirector = Redirector.new(link.url_hash)

    expect(redirector.process).to eq(nil)
  end

  it "deletes an inactive link when called" do
    link = generate_time_expired_link
    allow(Link).to receive(:find_by).and_return(link)

    redirector = Redirector.new(link.url_hash)
    expect(redirector.link).to receive(:destroy)

    redirector.process
  end

  it "increments the redirect_count of a valid link" do
    link = generate_valid_link
    link.redirect_count = 1
    allow(Link).to receive(:find_by).and_return(link)

    redirector = Redirector.new(link.url_hash)
    expect(link).to receive(:increment!).with(:redirect_count)
    redirector.process

  end

end
