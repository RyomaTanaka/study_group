require 'rails_helper'

RSpec.describe "Follows", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe "create", js: true do
    scenario "他のユーザーをフォローできる" do
      sign_in user
      other_user
      visit root_path
      # expect { 
      #   click_button "フォロー" 
      # }.to change{ user.active_relationships.count }.by(1)
      click_button "フォロー"
      expect(page).to have_content "解除"
    end
  end

  describe "show", js: true do
    scenario "フォローしたユーザー一覧を見ることができる" do
      sign_in user
      other_user
      visit root_path
      click_button "フォロー"
      click_link "マイページ"
      find(".follow").click 
      expect(page).to have_content "#{other_user.nickname}"
    end
  end
end