require 'rails_helper'

RSpec.feature "User can sign up" do
  scenario "when visits home page" do
    visit '/'

    expect(page).to have_content("Sign Up"
    )
    click_on "Sign Up"

    expect(current_path).to eq('/users/new')

    fill_in "Email", with: "betty@tnmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create account"

    expect(current_path).to eq "/links"
    expect(page).to have_content "New account successfully created!"
    expect(page).to have_content "Your URLockbox Link Index"
  end
end
