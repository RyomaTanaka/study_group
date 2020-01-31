require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }
  
  before do
    driven_by(:rack_test)
    sign_in user
    visit root_path
  end

  describe "show" do
    scenario "マイページが開ける" do
      click_link "マイページ"
      expect(page).to have_content "#{user.nickname}"
    end
  end

  describe "index" do
    scenario "ユーザー一覧が開ける" do
      click_link "ユーザー一覧"
      expect(page).to have_content "#{user.nickname}"
    end
  end

  describe "edit" do
    scenario "ユーザーを編集できる" do
      click_link "マイページ"
      click_link "プロフィールを編集する"
      fill_in "ニックネーム", with: "テスト勉強会2"
      fill_in "パスワード", with: "password"
      fill_in "パスワード（確認用）", with: "password"
      click_button "変更する"
      expect(page).to have_content "プロフィールが編集されました。"
    end
  end
end
