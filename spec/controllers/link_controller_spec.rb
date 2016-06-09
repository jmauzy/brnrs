require "rails_helper"

RSpec.describe LinkController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }

  describe "#create" do
    context "new link success" do
      before do
        @target_url = "http://www.google.com"
        @max_redirects = 5
        @expiration = 1496964947

        post :create, format: :json, link: {
          target_url: @target_url,
          max_redirects: @max_redirects,
          expiration: @expiration
        }
        @link = Link.last
      end

      it "correctly creates a link" do
        expect(@link.target_url).to eq(@target_url)
        expect(@link.max_redirects).to eq(@max_redirects)
        expect(@link.expiration).to eq(@expiration)
      end

      it "responds with 200" do
        expect(response.status).to eq(200)
      end

      it "returns properly formatted JSON" do
        @expected = {
          link: {
            url: "brnrs.io/#{@link.url_string}",
            target_url: @target_url,
            max_redirects: @max_redirects,
            expiration: @expiration,
          }
        }.to_json

        expect(JSON.parse(response.body)).to eq(JSON.parse(@expected))
      end
    end
  end
end
