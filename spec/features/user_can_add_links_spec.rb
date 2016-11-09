require 'rails_helper'

RSpec.feature "authenticated user can add a link", js: true do

  context "valid link url and title submitted" do
    scenario "sees link appear on index page" do

      user = User.create(email: "deb@tnemail.com", password: "password", password_confirmation: "password")
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      login(user)

      fill_in "Title", with: "TED: Ideas worth spreading"
      fill_in "Url", with: "https://www.ted.com/"
      click_on "Add new link"

      expect(page).to have_content("TED: Ideas worth spreading")
      expect(page).to have_content("https://www.ted.com/")
    end

      scenario "link must be valid" do

      user = User.create(email: "deb@tnemail.com", password: "password")
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      login(user)

      visit '/links'

      within(".add-link-form") do
        fill_in "Url", with: "squirrlystuff"
        fill_in "Title", with: "TED: Ideas worth spreading"
        click_on "Add new link"
      end

      expect(page).to have_content("Link is not valid. Please try adding again.")
    end
  end
end
