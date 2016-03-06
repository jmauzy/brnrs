require "rails_helper"

feature "User accesses site" do
  scenario "Homepage" do
    visit root_path

    expect(page).to have_http_status(200)
  end

end
