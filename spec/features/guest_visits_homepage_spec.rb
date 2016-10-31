require 'rails_helper'

RSpec.feature "Guest visits '/'" do
  scenario "see linls to log in or sign up" do
    visit '/'
    expect(page).to have_link('Log In')
    expect(page).to have_link('Sign Up')
  end
end
