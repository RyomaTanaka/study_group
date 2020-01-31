require 'rails_helper'

RSpec.describe "Follows", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe "create", js: true do
    scenario "他のユーザーをフォローできる" do
      sign_in user
      other_user
      visit root_path
      expect { click_button "フォロー" }.to change{ user.active_relationships.count }.by(1)
    end
  end

  
end