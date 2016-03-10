require "rails_helper"

describe "Redirector" do
  it "finds a record with a hash matching the first parameter" do

    expect(Link).to receive(:find_by).with(url_string: "test")

    Redirector.new("test")
  end

  it "assigns @link to nil if record doesn't exist" do
    redirector = Redirector.new("missing link")

    expect(redirector.link).to be_nil
  end
end

describe "#process" do

  it "returns the url of a valid link" do
    link = create(:link)
    redirector = Redirector.new(link.url_string)

    expect(redirector.process).to eq(link.url)
  end

  it "returns nil for a nonexistant link" do
    redirector = Redirector.new("missing link")

    expect(redirector.process).to eq(nil)
  end

  it "returns nil for an inactive link" do
    link = create(:time_expired_link)
    redirector = Redirector.new(link.url_string)

    expect(redirector.process).to eq(nil)
  end

  it "deletes an inactive link when called" do
    link = create(:redirect_expired_link)
    redirector = Redirector.new(link.url_string)
    
    expect(Link.find_by(link.id)).to_not eq(nil)
    
    redirector.process

    expect(Link.find_by(link.id)).to eq(nil)
  end

  it "increments the redirects of a valid link" do
    link = create(:link)

    redirector = Redirector.new(link.url_string)
    redirector.process

    expect(Link.find_by(link.id).redirects).to eq(1)

  end

end
