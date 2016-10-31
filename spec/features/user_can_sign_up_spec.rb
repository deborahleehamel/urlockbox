require 'rails_helper'

RSpec.feature "User can sign up" do
  scenario "when visits home page" do
    visit '/'
    click_on "Sign Up"

    fill_in "Email", with: "betty@tnmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create account"

    expect(current_path).to eq "root_path"
    expect(page).to have_content "New account successfully created!"
    expect(page).to have_content "Link Index for betty@tnmail.com"
  end
end
