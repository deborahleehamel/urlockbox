require "rails_helper"

RSpec.feature "User can Log in and Log out" do
  context "see Log in" do
    scenario "fills out form to Log in" do
      user = create(:user, email: "deb@tnemail.com", password: "password")
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      expect(current_path).to eq links_path
      expect(page).to have_content user.email
    end
  end
end
