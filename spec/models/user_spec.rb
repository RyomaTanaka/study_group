# frozen_string_literal: true

require 'rails_helper'
describe User do
  describe '#create' do
    it 'ニックネームがないと無効' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end
  end
end
