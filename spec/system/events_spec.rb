require 'rails_helper'

RSpec.describe "Events", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "イベント作成" do
    let(:user) { create(:user) }
    let(:image) { 'spec/factories/test.jpg' }
    let(:event) { create(:event) }

    scenario "イベント作成が成功する" do
      sign_in user
      visit root_path
      click_link "イベント作成"
      fill_in "タイトル", with: "テスト勉強会"
      fill_in "event[start_time]", with: "2020/12/31 12:00"
      fill_in "event[end_time]", with: "2020/12/31 17:00"
      fill_in "募集人数", with: 3
      attach_file "event[images_attributes][0][image]", image
      attach_file "event[images_attributes][1][image]", image
      attach_file "event[images_attributes][2][image]", image
      fill_in "event[address]", with: "東京タワー"
      fill_in "勉強会概要", with: "テスト勉強会です！"
      fill_in "event[content_list]", with: "テスト勉強会,初学者,rails,python"
      click_button "登録する"

      expect(page).to have_content "イベントが作成されました。"
    end
  end

  describe "イベント編集" do
    scenario "イベント編集が成功する" do
      user = create(:user)
      sign_in user
      event = create(:event_three_images, organaizer: user.id)
      visit event_path(event)
      click_link "イベントを編集"
      fill_in "タイトル", with: "テスト勉強会2"
      click_button "更新する"

      expect(page).to have_content "イベントが編集されました。"
    end
  end
end