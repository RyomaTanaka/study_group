require 'rails_helper'

describe User do
  describe '#create' do
    it '全項目が入っていれば有効' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'ニックネームがないと無効' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end

    it 'emailがないと無効' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'emailがすでに登録されていると無効' do
      create(:user)
      user = build(:user)
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end

    it 'アイコンがないと無効' do
      user = build(:user, icon: nil)
      user.valid?
      expect(user.errors[:icon]).to include('を入力してください')
    end

    it 'パスワードがないと無効' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

    it '自己紹介がないと無効' do
      user = build(:user, introduction: nil)
      user.valid?
      expect(user.errors[:introduction]).to include('を入力してください')
    end
  end
end