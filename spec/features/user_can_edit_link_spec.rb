require "rails_helper"

RSpec.feature "User can edit a link" do
  context "url is valid" do
    scenario "change url appears on page" do
      user = User.create(email: "deb@tnemail.com", password: "password")
      login(user)

      fill_in "Title", with: "TED: Ideas worth spreading"
      fill_in "Url", with: "https://www.ted.com/"
      click_on "Add new link"

      click_on "Edit"

      fill_in "Url", with: "http://different.org"
      click_on "Update Link"
      expect(page).to have_content "http://different.org"
      expect(page).to_not have_content "http://www.ted.com"
    end
  end

  context "url is not valid" do
    scenario "message appears on page" do
      user = User.create(email: "deb@tnemail.com", password: "password")
      login(user)

      fill_in "Title", with: "TED: Ideas worth spreading"
      fill_in "Url", with: "https://www.ted.com/"
      click_on "Add new link"

      click_on "Edit"

      fill_in "Url", with: "bubbles"
      click_on "Update Link"
      expect(page).to_not have_content "bubbles"
    end
  end


end
