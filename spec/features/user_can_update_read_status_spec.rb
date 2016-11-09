require "rails_helper"

RSpec.feature "User updates read status for link" do
  context "url is valid" do
    scenario "link is added to link table on home page" do
      user = create(:user, email: "deb@tnemail.com", password: "password")
      login(user)

      fill_in "Title", with: "Happy Days"
      fill_in "Url", with: "http://happy.com"
      click_on "Add new link"
      expect(page).to have_css '.Unread'

      click_on "Mark as Read"

      expect(page).to have_content "Mark as Unread"
      expect(page).to have_css '.Read'      
    end
  end
end
