require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  
  scenario "ログインが成功する" do
    user = create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"

    expect(page).to have_content 'ログインしました。'
  end
end
