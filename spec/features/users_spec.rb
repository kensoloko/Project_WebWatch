require "rails_helper"

RSpec.feature "Users", type: :feature do
  scenario "Create a new user" do
    visit signup_path

    fill_in "user_name", with: "fake1"
    fill_in "user_email", with: "fake1@fake.com"
    fill_in "user_phone", with: "0962415244"
    fill_in "user_address", with: "HN"
    fill_in "user_password", with: "123123"
    fill_in "user_password_confirmation", with: "123123"

    click_button "Sign Up"

    expect(page).to have_text("fake1")
  end
end
