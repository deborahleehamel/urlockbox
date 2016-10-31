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

    scenario "user unable to log in with invalid email" do
      visit login_path

      fill_in "Email", with: "Big fat greek wedding"
      fill_in "Password", with: "password"
      click_button "Log in"

      expect(page).to have_content("Oops! Please try again.")
      expect(page).to have_content("Log in")
    end

    scenario "user with account cannot log in with invalid password" do
      user = create(:user, email: "deb@tnemail.com", password: "password")
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "badpassword"
      click_button "Log in"

      expect(page).to have_content("Oops! Please try again.")
      expect(page).to have_content("Log in")
    end
  end

  context "see Log out" do
    scenario "user gets redirected to log in page after log out" do
      user = create(:user, email: "deb@tnemail.com", password: "password")
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Log in"

      expect(page).to have_content(user.email)

      click_link "Log out"

      expect(page).to have_content("You are logged out.")
      expect(page).to have_content("Log in")
    end
  end
end
