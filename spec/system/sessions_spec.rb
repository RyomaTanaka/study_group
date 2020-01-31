require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let(:user) { create(:user) }
  let(:image) { 'spec/factories/test.jpg' }

  before do
    driven_by(:rack_test)
  end

  describe "new" do
    scenario "アカウント作成が成功する" do
      visit root_path
      click_link "アカウント作成"
      fill_in "ニックネーム", with: "テスト 太郎"
      fill_in "Eメール", with: "test@gmail.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード（確認用）", with: "password"
      attach_file "アイコン", image
      fill_in "自己紹介", with: "よろしくお願いします！"
      click_button "作成する"
  
      expect(page).to have_content 'アカウント登録を受け付けました。'
    end
  end
  
  describe "new" do
    scenario "ログインが成功する" do
      visit root_path
      click_link "ログイン"
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "ログイン"
  
      expect(page).to have_content 'ログインしました。'
    end
  end
end