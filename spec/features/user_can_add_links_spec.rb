require 'rails_helper'

RSpec.feature "authenticated user can add a link" do

  context "valid link url and title submitted" do
    scenario "sees link appear on index page" do

      user = create(:user, password: "password")
      visit '/'
      click_on "Log In"

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Log in"

      fill_in "Title", with: "TED: Ideas worth spreading"
      fill_in "Url", with: "https://www.ted.com/"
      click_on "Add new link"

      visit "/links"

      expect(page).to have_content("TED: Ideas worth spreading")
      expect(page).to have_content("https://www.ted.com/")
    end
  end
end
